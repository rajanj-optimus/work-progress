namespace delegates
{
    class Program
    {
        public static void Main(string[] args)
        {
            //Console.WriteLine("hi");
            ////Check c= new Check();
            //int[] arr = { 1, 2, 3, 4, 5 };
            //foreach(int i in arr)
            //{
            //    Console.WriteLine(i);
            //}
            //Console.WriteLine(A.age);
            //B b=new B();
            //B bb=new B();
            //bb.age = 20;
            //Console.WriteLine(b.T);
            //int a = 10;
            //int b = 20;
            //string s= "Hello";
            //string ss = "Helloo";
            //ss = "Hello";
            //Console.WriteLine(s.Equals(ss));
            int[] arr=new int[1];
            arr[0] = 1;
            //arr[1] = 2;
            //foreach (int i in arr)
            //{
            //    Console.WriteLine(i);
            //}
            //Console.WriteLine((arr[1]));

        }
    }
    //abstract class Check
    //{
    //    public abstract void disp();
        
    //}
    abstract class A
    {
        public static int  age;
        public abstract   void Ab();

    }
    class B
    {
        public int age = 10;
        //public void fun()
        //{

        //}
    }
}
