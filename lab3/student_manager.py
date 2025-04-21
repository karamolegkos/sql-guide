import mysql.connector

# Establish connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="bakobako"
)

# Create a cursor object
cursor = db.cursor()

print("Connected to MySQL!")

cursor.execute("CREATE DATABASE IF NOT EXISTS school_db")
cursor.execute("USE school_db")
cursor.execute("""
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    age INT
)
""")

def add_student(name, age):
    cursor.execute("INSERT INTO students (name, age) VALUES (%s, %s)", (name, age))
    db.commit()

def list_students():
    cursor.execute("SELECT * FROM students")
    return cursor.fetchall()

def delete_student(name):
    cursor.execute("DELETE FROM students WHERE name = %s", (name,))
    db.commit()

def main_menu():
    while True:
        print("\n=== Student Manager ===")
        print("1. Add Student")
        print("2. View Students")
        print("3. Delete Student")
        print("4. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            name = input("Enter student name: ")
            age = int(input("Enter student age: "))
            add_student(name, age)
            print("Student added.")
        elif choice == "2":
            for s in list_students():
                print(s)
        elif choice == "3":
            name = input("Enter student name to delete: ")
            delete_student(name)
            print("Student deleted.")
        elif choice == "4":
            print("Exiting...")
            break
        else:
            print("Invalid choice. Try again.")

# Run the app
main_menu()