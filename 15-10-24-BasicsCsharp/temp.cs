namespace UserInterface
{
    //class A
    //{
    //    public void disp()
    //    {
    //        Console.WriteLine("class A");
    //    }
    //}
    //class B : A
    //{
    //    public void disp()
    //    {
    //        Console.WriteLine("class B");
    //    }
    //}
    //abstract class A
    //{
    //    public abstract void disp();


    //}
    //abstract class B :A
    //{
    //    public override void disp()
    //    {
    //        Console.WriteLine("class B");
    //    }
    //    //public  void disp1()
    //    //{
    //    //    Console.WriteLine("class B");
    //    //}
    //    //public void disp1();
    //}
    //abstract class C : A, B
    //{

    //}
    //interface A
    //{
    //     void disp();
        

    //}
    //class Ainh: A
    //{
    //    public void disp()
    //    {
    //        Console.WriteLine("Ainh");
    //    }
    //}
    //class A
    //{
    //    public virtual void disp()
    //    {
    //        Console.WriteLine("class A");
    //    }
    //}
    //class B : A
    //{
    //    public override void disp()
    //    {
    //        Console.WriteLine("class B");
    //    }
    //}
    //interface Animal
    //{
    //    void sound();
    //}
    //class DOG : Animal
    //{
    //    public void sound()
    //    {
    //        Console.WriteLine("dog");
    //    }
    //}
    class A<T>
    {
        public T add(T a,T b)
        {
            T c= a + b;
            return c;
        }
    }
}