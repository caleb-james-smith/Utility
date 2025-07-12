# letsGoBaby.py

import datetime

def runBabyCalc():
    print("Let's go, baby!")
    date_format = "%Y-%m-%d"
    conception_date_object = getConceptionDateObject(date_format)
    due_date_object = calcDueDateObject(conception_date_object)
    due_date = due_date_object.strftime(date_format)
    print(f"Due date: {due_date}")

def getConceptionDateObject(date_format):
    conception_date = input("Please enter the date of conception (YYYY-MM-DD): ")
    conception_date_object = datetime.datetime.strptime(conception_date, date_format)
    return conception_date_object

def calcDueDateObject(conception_date_object):
    due_date_object = conception_date_object + datetime.timedelta(weeks=38)
    return due_date_object

def main():
    runBabyCalc()

if __name__ == "__main__":
    main()

