using System;
using System.Collections;
using System.Collections.Generic;
namespace CustomCollection
{
    public class IncrementByTwoCollection<T> :IEnumerable<T>
    {
        private List<T> data = new List<T>();

        public void Push(T Val)
        {
            data.Add(Val);
        }

        public IEnumerator<T> GetEnumerator()
        {
            for (int i = 0; i < data.Count; i += 2)
            {
                yield return data[i];
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }


}
