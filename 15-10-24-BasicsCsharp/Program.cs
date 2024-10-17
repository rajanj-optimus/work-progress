using System;
//using BC;
//using BC.CC;
//using BC;
using UserInterface ;
namespace BasicsCsharp
{
    class Program
    {
        public static void Main(string[] args)
        {
            //Console.WriteLine("hi");
            //BC.AAA a = new BC.AAA();

            //int b = 10;
            ////Console.WriteLine(&b);
            //unsafe
            //{
            //    int* a = &b;
            //    //int* a = &b;
            //    //*a = 20;
            //    //Console.WriteLine(&a);
            //}
            //B b=new B();
            //b.disp();

            //A a=new Ainh();
            //a.disp();
            //A a = new B();
            //a.disp();
            //Animal dog = new DOG();
            //dog.sound();
            A<int> a = new A<int>();
            Console.WriteLine(a.add(1, 1));
        }
    }
}



