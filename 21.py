import subprocess as sp
import pymysql
import pymysql.cursors
import random
from tabulate import tabulate

def option2():
    """
    Function to implement option 2
    """
    print("Not implemented")


def promote():
    """
    Function to implement Promote Employee
    """
    print("-x-x-x-x-x-x- Promote Employee -x-x-x-x-x-x-")
    while True:
        name = input("Name of the employee (Fname Lname): ").split(' ')
        query = "SELECT * FROM RAILWAY_EMPLOYEES_A WHERE FirstName = '%s' AND LastName = '%s'" % (name[0], name[1])
        cur.execute(query)
        tab = cur.fetchall()
        if len(tab):
            print(tabulate(tab, headers="keys", tablefmt='psql'))
            break
        else:
            print("Employee <", name[0], ", ", name[1], "> not found")
    while True:
        des = input("Promote to: ")
        query = "SELECT * FROM RAILWAY_EMPLOYEES_B WHERE Designation = '%s'" % (des)
        cur.execute(query)
        tab = cur.fetchall()
        if len(tab) == 0:
            print("Promotion to <", des,"> is not possible")
        else:
            break
    while True:
        transfer = input("Transfer to: ")
        query = "SELECT * FROM STATIONS WHERE StationID = '%s'" % (transfer)
        cur.execute(query)
        tab = cur.fetchall()
        if len(tab) == 0:
            print("Transfer to <", transfer, "> is not possible")
        else:
            break
    query = "UPDATE RAILWAY_EMPLOYEES_A SET Designation = '%s', StationID = '%s' WHERE FirstName = '%s' AND LastName = '%s'" %(des, transfer, name[0], name[1])
    cur.execute(query)
    query = "UPDATE EMPLOYEES_CONTACT_NUMBERS SET Designation = '%s' WHERE FirstName = '%s' AND LastName = '%s'" %(des, name[0], name[1])
    cur.execute(query)
    con.commit()

    print("The updated entry is: ")
    query = "SELECT * FROM RAILWAY_EMPLOYEES_A WHERE FirstName = '%s' AND LastName = '%s'" % (name[0], name[1])
    cur.execute(query)
    tab = cur.fetchall()
    print(tabulate(tab, headers="keys", tablefmt='psql'))
    return

def pre_postpone():
    """
    Function to implement Change DOJ
    """
    print("-x-x-x-x-x-x- Change DOJ -x-x-x-x-x-x-")
    while True:
        name = input("Name of the passenger (Fname Lname): ").split(' ')
        query = "SELECT * FROM PASSENGERS WHERE FirstName = '%s' AND LastName = '%s'" % (name[0], name[1])
        cur.execute(query)
        tab = cur.fetchall()
        if len(tab):
            print(tabulate(tab, headers="keys", tablefmt='psql'))
            break
        else:
            print("Employee <", name[0], ", ", name[1], "> not found")
    date = input("Change to (YYYY-MM-DD): ")
    query = "UPDATE PASSENGERS SET DOJ = '%s', Tier = '%d', SeatNo = '%d' WHERE FirstName = '%s' AND LastName = '%s'" % (date, random.randint(1, 5), random.randint(1, 65), name[0], name[1])
    cur.execute(query)
    con.commit()

    print("The updated entry is: ")
    query = "SELECT * FROM PASSENGERS WHERE FirstName = '%s' AND LastName = '%s'" % (name[0], name[1])
    cur.execute(query)
    tab = cur.fetchall()
    print(tabulate(tab, headers="keys", tablefmt='psql'))
    return

def renovate():
    """
    Renovate a Station or a Train
    """
    while True:
        query = input("What would you like to renovate? (Station or Train) ")
        if query == "Station":
            while True:
                id = input("Enter the Station ID: ")
                query = "SELECT * FROM STATIONS WHERE StationID = '%s'" % (id)
                cur.execute(query)
                tab =cur.fetchall()
                if len(tab):
                    print(tabulate(tab, headers="keys", tablefmt='psql'))
                    break
                else:
                    print("Station <", id, "> not found")
            name = input("Enter the new Station Name: ")
            n_id = input("Enter the new Station ID: ")
            query = "UPDATE STATIONS SET StationName = '%s', StationID = '%s' WHERE StationID = '%s'" % (name, n_id, id)
            cur.execute(query)
            con.commit()

            print("The updated entry is: ")
            query = "SELECT * FROM STATIONS WHERE StationID = '%s'" % (n_id)
            cur.execute(query)
            tab = cur.fetchall()
            print(tabulate(tab, headers="keys", tablefmt='psql'))
            return
        elif query == "Train":
            while True:
                name = input("Enter the Train Name: ")
                query = "SELECT * FROM TRAINS WHERE TrainName = '%s'" % (name)
                cur.execute(query)
                tab =cur.fetchall()
                if len(tab):
                    print(tabulate(tab, headers="keys", tablefmt='psql'))
                    break
                else:
                    print("Train <", name, "> not found")
            n_name = input("Enter the new Train Name: ")
            num = int(input("Enter the new Train Number: "))
            query = "UPDATE TRAINS SET TrainName = '%s', TrainNumber = '%d' WHERE TrainName = '%s'" % (n_name, num, name)
            cur.execute(query)
            con.commit()

            print("The updated entry is: ")
            query = "SELECT * FROM TRAINS WHERE TrainName = '%s'" % (n_name)
            cur.execute(query)
            tab = cur.fetchall()
            print(tabulate(tab, headers="keys", tablefmt='psql'))
            return
        else:
            print("Please choose a valid option")
            continue

def query1():
    query = """
            SELECT P.FirstName AS "First Name", P.LastName AS "Last Name", P.DOB, P.Final, P.Class, P.Tier, P.SeatNo AS "Seat Number", P.Age, P.DOJ, P.TrainName AS "Train Name"
            FROM PASSENGERS P, PASSENGERS Q 
            WHERE P.DOJ = Q.DOJ AND P.Final = Q.Final AND P.FirstName <> Q.FirstName AND P.LastName <> Q.LastName ORDER BY P.DOJ;
            """
    cur.execute(query)
    tab = cur.fetchall()
    print(tabulate(tab, headers="keys", tablefmt="psql"))
    return

def query2():
    query = """
            SELECT S.StationName AS "Station Name", S.StationID AS "Station ID", T.Count 
            FROM STATIONS S, (
                              SELECT COUNT(*) AS "Count", StationID 
                              FROM RUNS_THROUGH 
                              GROUP BY StationID 
                              ORDER BY COUNT(*) DESC 
                              LIMIT 1
                              ) T 
            WHERE S.StationID = T.StationID;
            """
    cur.execute(query)
    tab = cur.fetchall()
    print(tabulate(tab, headers="keys", tablefmt="psql"))
    return

def query3():
    query = """
            SELECT B.QuartersNo AS "Quarters Number", COUNT(*) AS "Number of Residents" 
            FROM RAILWAY_EMPLOYEES_A A JOIN RAILWAY_EMPLOYEES_B B ON A.Designation = B.Designation 
            GROUP BY B.QuartersNo;
            """
    cur.execute(query)
    tab = cur.fetchall()
    print(tabulate(tab, headers="keys", tablefmt="psql"))
    return

def query4():
    query = """
            SELECT FirstName AS "First Name", LastName AS "Last Name", Designation 
            FROM RAILWAY_EMPLOYEES_A 
            WHERE StationID = "BCT";
            """
    cur.execute(query)
    tab = cur.fetchall()
    print(tabulate(tab, headers="keys", tablefmt="psql"))
    return

def query5():
    query = """
            SELECT T.TrainNumber AS "Train Number", R.TrainName AS "Train Name" 
            FROM RUNS_THROUGH R, RUNS_THROUGH S, TRAINS T 
            WHERE R.TrainName = S.TrainName AND R.StationID="SEC" AND S.StationID="BCT" AND R.TrainName = T.TrainName;
            """
    cur.execute(query)
    tab = cur.fetchall()
    print(tabulate(tab, headers="keys", tablefmt="psql"))
    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        query1()
    elif(ch == 2):
        query2()
    elif(ch == 3):
        query3()
    elif(ch == 4):
        query4()
    elif(ch == 5):
        query5()
    elif(ch == 6):
        renovate()
    elif(ch == 7):
        promote()
    elif(ch == 8):
        pre_postpone()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="Babloo@2003",
                              db='RAILWAY',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                print("1. Query 1")  
                print("2. Query 2")
                print("3. Query 3")
                print("4. Query 4")
                print("5. Query 5")
                print("6. Renovate")  
                print("7. Promote Employee") 
                print("8. Change DOJ")  
                print("9. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 9:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
