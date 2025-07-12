# letsGoBaby.py

import datetime

def runBabyCalc():
    print("Let's go, baby!")
    date_format = "%Y-%m-%d"

    conception_date = input("Please enter the date of conception (YYYY-MM-DD): ")
    conception_date_object = getConceptionDateObject(conception_date, date_format)
    
    today_date_object = datetime.datetime.today()
    today_date = today_date_object.strftime(date_format)
    
    due_date_object = calcDueDateObject(conception_date_object)
    due_date = due_date_object.strftime(date_format)

    pregnancy_duration = due_date_object - conception_date_object
    completed_duration = today_date_object - conception_date_object
    remaining_duration = due_date_object - today_date_object
    
    # Print results
    print(f" - Conception date: {conception_date}")
    print(f" - Today's date: {today_date}")
    print(f" - Due date: {due_date}")
    print(f" - Pregnancy duration: {pregnancy_duration.days/7:.2f} weeks = {pregnancy_duration.days} days")
    print(f" - Completed duration: {completed_duration.days/7:.2f} weeks = {completed_duration.days} days")
    print(f" - Remaining duration: {remaining_duration.days/7:.2f} weeks = {remaining_duration.days} days")

def getConceptionDateObject(conception_date, date_format):
    conception_date_object = datetime.datetime.strptime(conception_date, date_format)
    return conception_date_object

def calcDueDateObject(conception_date_object):
    due_date_object = conception_date_object + datetime.timedelta(weeks=38)
    return due_date_object

def main():
    runBabyCalc()

if __name__ == "__main__":
    main()

