using System.Collections;
using System.Collections.Generic;

namespace collection
{
    class Program
    {
        public static void Main(string[] args)
        {
            ArrayList array = new ArrayList{ "a"};
            array.Add(1);
            array.Add('a');
            array.Add("abc");
            array.Add(1.346);
            array.Add(true);
            //array.Capacity;
            DateTime d = DateTime.Parse("8-oct-1985");
            //array.Sort();
            array.Add(d);
            foreach (Object i in array)
            {
                Console.WriteLine(i);
            }

            Hashtable ht = new Hashtable();
            ht.Add("a", 1);
            ht.Add("b", 2);
            ht.Add('a', 4);
            ht.Add(4, 5);
            ht.Add(1.2, 6);
            //ht.Add('a', "ef");
            ht[4] = 9;
            foreach (DictionaryEntry i in ht)
            {
                Console.WriteLine(i.Key+" -> "+i.Value);
            }
            Console.WriteLine(ht['a']);
            SortedList sl = new SortedList();
            sl.Add('a', 11);
            sl.Add('b', "ads");
            sl.Add('w', 1);
            foreach(DictionaryEntry i in sl)
            {
                Console.WriteLine(i.Key+" -> "+i.Value);
            }
            Console.WriteLine(sl['a']);
             
            Stack st=new Stack();
            st.Push("a");
            st.Push(1);
            st.Push(2.25263);
            foreach(object i in st)
            {
                Console.WriteLine(i) ;
            }
            Queue que=new Queue();
            que.Enqueue("a");
            que.Enqueue(1);
            que.Enqueue(34.246347);
            foreach(object i in que)
            {
                Console.WriteLine(i);
            }

            //Generic
            List<int> list = new List<int>{ 1,1,1};
            list.Add(1);
            list.Add('a');
            list.Sort();
            foreach(var i in list)
            {
                Console.WriteLine(i);
            }

            Dictionary<int, int> dic = new Dictionary<int, int>();
            dic[1] = 3;

            foreach (KeyValuePair<int,int> i in dic)
            {
                Console.WriteLine(i.Key + " -> " + i.Value);
            }
            CaseInsensitiveComparer comparer = new CaseInsensitiveComparer();
            Console.WriteLine("CaseInsesitiveComparer");
            Console.WriteLine(comparer.Compare("abc","Abc"));


        }
    }
}
