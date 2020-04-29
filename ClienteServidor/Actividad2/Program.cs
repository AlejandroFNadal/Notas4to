using System;
using Microsoft.Data.Sqlite;

namespace sqlite_app
{
    public class Student
    {
        public int StudentId;

        public void setStudentId(int num)
        {
            this.StudentId = num;
        }
        public int getStudentId()
        {
            return this.StudentId;
        }
        public void setName(string name)
        {
            this.Name = name;
        }
        public string getName()
        {
            return this.Name;
        }
        public string Name;
        

        public void insertar_Student(SqliteConnection connection)
        {
            var query = connection.CreateCommand();
            query.CommandText = "INSERT INTO Estudiante(id,name) VALUES(@param1,@param2)";
            query.Parameters.Add(new SqliteParameter("@param1",this.StudentId));
            query.Parameters.Add(new SqliteParameter("@param2",this.Name));
            query.ExecuteNonQuery();
        }
    }

    public class Course
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }  
    }
    class Program
    {

        static void Main(string[] args)
        {
            var connectionStringBuilder = new SqliteConnectionStringBuilder();

            //Use DB in project directory.  If it does not exist, create it:
            connectionStringBuilder.DataSource = "./SqliteDB.db";

            using (var connection = new SqliteConnection(connectionStringBuilder.ConnectionString))
            {
                connection.Open();

                //Create a table (drop if already exists first):
                
                var delTableCmd = connection.CreateCommand();
                delTableCmd.CommandText = "DROP TABLE IF EXISTS Estudiante";
                delTableCmd.ExecuteNonQuery();

                var createTableCmd = connection.CreateCommand();
                createTableCmd.CommandText = "CREATE TABLE Estudiante(id int, name VARCHAR(50), PRIMARY KEY (id))";
                createTableCmd.ExecuteNonQuery();

                delTableCmd.CommandText = "DROP TABLE IF EXISTS Course";
                delTableCmd.ExecuteNonQuery();

                createTableCmd.CommandText=" CREATE TABLE Course(id int, name VARCHAR(50),PRIMARY KEY(id))";
                createTableCmd.ExecuteNonQuery();
                //Seed some data:
                Student obj1 = new Student();
                obj1.setStudentId(12);
                obj1.setName("Ale");
                
                using (var transaction = connection.BeginTransaction())
                {
                    
                    var insertCmd = connection.CreateCommand();
                    obj1.insertar_Student(connection);
                    /*insertCmd.CommandText = "INSERT INTO favorite_beers VALUES('LAGUNITAS IPA')";
                    insertCmd.ExecuteNonQuery();

                    insertCmd.CommandText = "INSERT INTO favorite_beers VALUES('JAI ALAI IPA')";
                    insertCmd.ExecuteNonQuery();

                    insertCmd.CommandText = "INSERT INTO favorite_beers VALUES('RANGER IPA')";
                    insertCmd.ExecuteNonQuery();*/

                    transaction.Commit();
                }
                
                //Read the newly inserted data:
                var selectCmd = connection.CreateCommand();
                selectCmd.CommandText = "SELECT * FROM Estudiante";

                using (var reader = selectCmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var message = reader.GetString(0)+" "+reader.GetString(1);
                        Console.WriteLine(message);
                    }
                }


            }
        }
    }
}
