# letsGoBaby.py

import datetime

def main():
    print("Hello, baby!")
    date_format = "%Y-%m-%d"
    conception_date = input("Please enter the date of conception (YYYY-MM-DD): ")
    conception_date_object = datetime.datetime.strptime(conception_date, date_format)
    due_date_object = conception_date_object + datetime.timedelta(weeks=38)
    due_date = due_date_object.strftime("%Y-%m-%d")
    print(f"Due date: {due_date}")

if __name__ == "__main__":
    main()

