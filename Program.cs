namespace Temp
{
    class Program
    {
        public static void Main(string[] args)
        {
            List<Department> departments = Department.GetAllDepartments();
            List<Employee> employees = Employee.GetAllEmployees();
            var grpJoin = from dep in departments
                          join emp in employees on dep.ID equals emp.DepartmentId into final 
                          select new { final ,dep.DName, dep.ID }; 


            foreach (var x in grpJoin)
            {
                //Console.WriteLine(x);
                //Console.WriteLine("department Id -> "+x.DepartmentId+", department Name -> " +"khali"+" ");
                Console.WriteLine(x.final.GetType());
                Console.WriteLine(x.ID + x.DName);

                foreach (var y in x.final)
                {
                    Console.WriteLine(y.GetType());

                    Console.WriteLine(" Name-> "+y.Name +", dep Id -> "+y.DepartmentId+" "+"emp Id "+y.ID);
                }
            }
            var join = from dep in departments
                       join emp in employees on dep.ID equals emp.DepartmentId
                       select new { dep.ID, dep.DName, emp.DepartmentId, emp.Name, idd=emp.ID };
            Singleton.fun();
            Singleton.fun();
            Singleton.fun();
            Singleton obj = Singleton.createInstance();
            CheckStatic cs = new CheckStatic();
            CheckStatic.set2(10);
            Console.WriteLine(CheckStatic.x);

            cs.set(1000);
            Console.WriteLine(CheckStatic.x);
            VVV v = new VVV();
            VVV.fun();
            SS.d();

        }

    }
    class A
    {
        public static   void Fun()
        {
            Console.WriteLine("Fun fro class A");
        }
        public static   void Fun(int x)
        {
            Console.WriteLine("Fun fro class A");
        }
    }
    public class Department
    {
        public int ID { get; set; }
        public string DName { get; set; }
        public static List<Department> GetAllDepartments()
        {
            return new List<Department>()
            {
                new Department { ID = 10, DName = "IT"},
                new Department { ID = 20, DName = "HR"},
                new Department { ID = 30, DName = "Sales"  },
            };
        }
    }
    public class Employee
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int DepartmentId { get; set; }
        public static List<Employee> GetAllEmployees()
        {
            return new List<Employee>()
            {
                new Employee { ID = 1, Name = "Preety", DepartmentId = 10},
                new Employee { ID = 1, Name = "Preety", DepartmentId = 20},
                new Employee { ID = 2, Name = "Priyanka", DepartmentId =20},
                new Employee { ID = 3, Name = "Anurag", DepartmentId = 30},
                new Employee { ID = 4, Name = "Pranaya", DepartmentId = 30},
                new Employee { ID = 5, Name = "Hina", DepartmentId = 20},
                new Employee { ID = 6, Name = "Sambit", DepartmentId = 10},
                new Employee { ID = 7, Name = "Happy", DepartmentId = 10},
                new Employee { ID = 8, Name = "Tarun", DepartmentId = 0},
                new Employee { ID = 9, Name = "Santosh", DepartmentId = 10},
                new Employee { ID = 10, Name = "Raja", DepartmentId = 20},
                new Employee { ID = 11, Name = "Ramesh", DepartmentId = 30}
            };
        }
    }
    class Singleton
    {
        private static Singleton instance;
        private Singleton()
        {
            Console.WriteLine("private cons");
        }
        //public static Singleton Instance
        //{
        //    get
        //    {
        //        if (instance == null)
        //        {
        //            instance = new Singleton();
        //        }
        //        return instance;
        //    }
        //}
        public static Singleton createInstance()
        {
            if(instance == null)
            {
                instance = new Singleton();
            }
            return instance;
        }
        public static void fun()
        {
            Console.WriteLine("private cons class");
        }
    }
    class CheckStatic
    {
        static public int x;
         public int xx;
        //static CheckStatic()
        //{
        //    x = 10;
        //}
        public void set(int t)
        {
            x = t;
            //Console.WriteLine(x);
        }
        public static void set2(int t)
        {
            x = t;
            //Console.WriteLine(x);
        }
        static  void dis(int t)
        {
            Console.WriteLine(t);
        }


    }
    abstract class DD
    {
        static void fun()
        {
            Console.WriteLine("DD");
        }
        //public static abstract void d();
        
    }
    class VV
    {
        public static void fun()
        {
            Console.WriteLine("vv");
        }
    }
    class VVV : VV
    {

    }
    static class SS
    {
        static SS()
        {
            Console.WriteLine("SS static cons");
        }
        //SS()
        //{

        //}
        public static void d()
        {
            Console.WriteLine("dd");
        }
    }


}