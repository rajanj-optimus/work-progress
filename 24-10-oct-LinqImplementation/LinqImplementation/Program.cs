using System.Net.WebSockets;
//using System.Collections as ww;
using xx = int;

namespace LinqImplementation
{
    class Program
    {
        public static void Main(string[] args)
        {
            int[] inetegerData = { 1, 4, 3, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 11, 18, 19, 20, 21, 22, 2, 24, 25, 26, 27, 28, 9, 0, 31, 3 };
            IEnumerable<int> filteredData = from i in inetegerData
                                            where i % 2 == 0
                                            select i;

            Func<int, bool> Fun = delegate (int i)
            {
                return i % 2 == 0;
            };


            IEnumerable<int> filteringDataUsingDelegate = from i in filteredData
                                                          where Fun(i)
                                                          select i;
            foreach (int i in filteringDataUsingDelegate)
            {
                Console.WriteLine(i);
            }
            IEnumerable<int> filteringDataUsingMethodSyntax = inetegerData.Where(i => i % 2 == 0);

            List<Student> studentList = new List<Student>()
            {
                new Student(1, "John", 18),
                new Student(2, "Steve", 21),
                new Student(3, "Bill", 18),
                new Student(4, "Ram", 20),
                new Student(5, "Abram", 21)
            };
            IEnumerable<IGrouping<int, Student>> groupedData = from s in studentList
                                                               group s by s.age;
            //select new {x.};
            IEnumerable<IGrouping<int, Student>> groupedDataMethodSyntax = studentList.GroupBy(s => s.age);


            foreach (IGrouping<int, Student> k in groupedData)
            {
                Console.WriteLine(k.Key);
                foreach (Student s in k)
                {
                    Console.WriteLine($"  ID: {s.studentID}, Name: {s.studentName}");
                }
            }

            //Join
            List<Standard> standardList = new List<Standard>() {
                new Standard(1, "Standard 1"),
                new Standard(2, "Standard 2"),
                new Standard(3, "Standard 3")
            };
            Console.WriteLine("join using query syntax");
            //here i am using anonymous type so using var is good, but if we want, we need to define some other class or anything that who will contain all these anonymous type
            //public class StudentStandardInfo
            //{
            //    public int StudentID { get; set; }
            //    public string StudentName { get; set; }
            //    public string StandardName { get; set; }
            //    public int Age { get; set; }
            //};
            //IEnumerable<StudentStandardInfo> joinedResult = ...
            //or
            //List<StudentStandardInfo> joinedResult = ...

            var joinResult = from s in studentList
                             join st in standardList on s.studentID equals st.studentID
                             select new
                             {
                                 studentIDdd = s.studentID,
                                 studentName = s.studentName,
                                 standardName = st.standardName,
                                 age = s.age
                             };
            foreach (var i in joinResult)
            {
                Console.WriteLine(i);
                //Console.WriteLine(i.studentIDdd+" "+i.studentName+ " " + i.age+ " " + i.standardName);
            }
            Console.WriteLine("join using method syntax");

            var joinResultByMethodSyntax = studentList.Join(standardList, s => s.studentID, st => st.studentID, (s, st) => new { s.studentID, s.studentName, st.standardName, s.age });

            foreach (var i in joinResultByMethodSyntax)
            {
                Console.WriteLine(i);
                //Console.WriteLine(i.standardName+" "+i.studentName+" "+i.age+" "+i.studentID);
            }
            Console.WriteLine("Group join using method syntax");

            var groupJoinResultByMethodSyntax = studentList.Join(standardList, s => s.studentID, st => st.studentID, (s, st) => new { s.studentID, s.studentName, st.standardName, s.age });
            foreach (var i in groupJoinResultByMethodSyntax)
            {
                Console.WriteLine(i);
                //foreach( var j in i.standardName)
                //{
                //    Console.WriteLine(j);
                //}
            }
            //select many and select
            Console.WriteLine("select many");
            List<List<int>> matrixx = new List<List<int>>
            {
                new List<int> { 1, 2, 3 },
                new List<int> { 4, 5, 6 },
                new List<int> { 7, 8, 9 }
            };
            //IEnumerable<IEnumerable<int>>result = matrixx.Select(val => val);
            IEnumerable<int> result = matrixx.SelectMany(x => x);
            foreach (var i in result)
            {
                Console.WriteLine(i);
            }
            Console.WriteLine("groubp by on more than one key");

            List<Student2> students2 = new List<Student2>
            {
                new Student2("Alice", 20, "A"),
                new Student2("Eve", 20, "A"),
                new Student2("Grace", 21, "A"),
                new Student2("Charlie", 21, "A"),
                new Student2("Bob", 20, "B"),
                new Student2("David", 21, "B"),
                new Student2("Frank", 22, "B")
            };
            IEnumerable<IGrouping<object, Student2>> groubByTwoResult = students2.GroupBy(s => new { s.Grade, s.Age });
            foreach (var group in groubByTwoResult)
            {
                Console.WriteLine(group.Key);
                foreach (var student in group)
                {
                    Console.WriteLine(student.Grade + " " + student.Age + " " + student.Name);
                }
            }

            IEnumerable<IGrouping<object, Student2>> groubByTwoResultQuery = from student in students2
                                                                             group student by new { student.Age, student.Grade };
            foreach(var group in groubByTwoResultQuery)
            {
                Console.WriteLine(group.Key);
                foreach(var student in group)
                {
                    Console.WriteLine(student.Grade + " " + student.Age + " " + student.Name);
                }
            }
            //var temp = students2.SelectMany();
            int agg = inetegerData.Aggregate((s, x) => s + x);
            Console.WriteLine(agg);
            //foreach(var group in agg)
            //{
            //    Console.WriteLine(group);
            //}
            List<int> li = new List<int> { 1, 2, 3 };
            foreach (var i in li)
            {
                Console.WriteLine(i);
                li.Add(10);
            }
            xx c = 10;


        }
        class Student
        {
            public int studentID { get; set; }
            public string studentName { get; set; }
            public int age { get; set; }
            public Student(int studentID, string studentName, int age)
            {
                this.studentID =studentID;
                this.studentName = studentName;
                this.age = age;
            }
        }
        class Standard 
        {
            public int studentID { get; set; }
            public string standardName { get; set; }
            public Standard(int  studentID, string standardName)
            {
                this.studentID = studentID;
                this.standardName = standardName;

            }
            
                
        }
        class Student2
        {
            public string Name { get; set; }
            public int Age { get; set; }
            public string Grade { get; set; }

            public Student2(string name, int age, string grade)
            {
                Name = name;
                Age = age;
                Grade = grade;
            }
        }
    }
    
}