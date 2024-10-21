using CustomCollection;

namespace CollectionInterface
{
    class A
    {

        public int a;
        static  A()
        {

            Console.WriteLine("static construc");

        }
      
        public static void disp()
        {
            Console.WriteLine("hi");
        }
        public void displ(string s) { Console.WriteLine("nfr"); }
    }
    class B : A
    {

    }
    class Program
    {
        public static void Main()
        {
            //IncrementByTwoCollection<int> temp = new IncrementByTwoCollection<int>();
            ////int num = new int();
            //temp.Push(1);
            //temp.Push(2);
            //temp.Push(3);
            //temp.Push(4);
            //temp.Push(5);
            //foreach (int i in temp)
            //{
            //    Console.WriteLine(i);
            //}
            //B b= new B();
            //b.disp();
            //A a= new A();
            //a.disp();
            //A.disp();
            A a = new A();
            A aa = new A();
            //a.disp();
            //B.disp();
            //A.disp();
        }
    }
}
