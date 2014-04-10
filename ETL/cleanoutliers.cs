// W.I.P

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            var findem = new List<string>();
            //string li = "the|quick|Abro|wnA|fox|jumped";
            string norm = "the|quick|brown|fox|jumped|over|the|lazy|dogs"; //8
            string li = "theA|Aq|u|ickA|AbrownA|Af|o|xA|Ajumped|overA|AtheA|Alazy|dogs"; //8 shows 12

            // All Testing:
            int diff = 4;

            string rev = RevString(li);
            int x = 0, y = 0, z = 0, a = 0;

            //Console.WriteLine(li);
            //Console.WriteLine(rev);

            foreach (char l in li)
            {
                y++;
                if (l.Equals('|'))
                {
                    x = y - 1;
                    string fwd = li.Substring(x, 2);
                    //Console.WriteLine(fwd);
                    findem.Add(fwd);
                }
            }

            foreach (char l in rev)
            {
                z++;
                if (l.Equals('|'))
                {
                    a = z - 1;
                    string bck = rev.Substring(a, 2);
                    //Console.WriteLine(bck);
                    findem.Add(bck);
                }
            }

            var g = findem.GroupBy(s => s).Select(group => new { Word = group.Key, Count = group.Count() });
            foreach (var i in g)
            {
                if (i.Count > 1)
                {
                    int div = i.Count / diff;
                    if (div > 0)
                    {
                        string newdel = i.Word.Replace(i.Word,i.Word.Substring(1, 1) + i.Word);
                        if (li.Contains(newdel))
                        {
                            Console.WriteLine("Yes!");
                        }
                        Console.WriteLine(newdel + ": " + div.ToString());

                    }
                }
            }

            
            Console.ReadLine();
        }

        public static string RevString(string s)
        {
            char[] ay = s.ToArray();
            Array.Reverse(ay);
            return new string(ay);
        }
    }
}
