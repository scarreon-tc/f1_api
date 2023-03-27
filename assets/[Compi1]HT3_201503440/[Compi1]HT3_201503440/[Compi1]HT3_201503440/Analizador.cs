using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Irony.Parsing;
using System.IO;
using System.Windows.Forms;

namespace _Compi1_HT3_201503440
{
    class Analizador
    {
        String graph = "";
        public Double resultado = 0;

        public bool Valida(string codigo, Grammar grammar)
        {
            LanguageData lenguaje = new LanguageData(grammar);
            Parser p = new Parser(lenguaje);
            ParseTree arbol = p.Parse(codigo);


            if (arbol.Root != null)
            {
                //Genarbol(arbol.Root);
                //GenerateGraph("HT3.txt", "C:/HT3/");
                try
                {
                    resultado = (Double)ejecutar(arbol.Root);                                        
                }
                catch { }
            }

            return arbol.Root != null;
        }

        public Object ejecutar(ParseTreeNode raiz)
        {
            string I = raiz.ToString();
            I = I.Replace(" (entero)", "").Replace(" (decimal)", "");
            ParseTreeNode[] hijos = null;
            if (raiz.ChildNodes.Count > 0)
            {
                hijos = raiz.ChildNodes.ToArray();
            }
            switch (I)
            {
                case "S":
                    {
                        return ejecutar(hijos[0]);
                    }
                case "E":
                    {
                        if (hijos.Count() > 1) {
                            Object iz = ejecutar(hijos[0]).ToString().Replace(" (entero)", "").Replace(" (decimal)", "");
                            Object de = ejecutar(hijos[2]).ToString().Replace(" (entero)", "").Replace(" (decimal)", "");
                            if (hijos[1].ToString().Contains("+"))
                            {                                
                                return Convert.ToDouble(iz) + Convert.ToDouble(de);
                            }
                            else if (hijos[1].ToString().Contains("-"))
                            {
                                return Convert.ToDouble(iz) - Convert.ToDouble(de);
                            }
                            else if (hijos[1].ToString().Contains("*"))
                            {
                                return Convert.ToDouble(iz) * Convert.ToDouble(de);
                            }
                            else if (hijos[1].ToString().Contains("/"))
                            {
                                return Convert.ToDouble(iz) / Convert.ToDouble(de);
                            }
                            else if (hijos[1].ToString().Contains("^"))
                            {
                                return Math.Pow(Convert.ToDouble(iz), Convert.ToDouble(de));
                            }
                        } else {
                            return hijos[0];
                        }
                        return null;
                    }
              }

            return null;

        }

        public void Genarbol(ParseTreeNode raiz)
        {
            System.IO.StreamWriter f = new System.IO.StreamWriter("C:/HT3/HT3.txt");
            f.Write("digraph lista{ rankdir=TB;node [shape = box, style=rounded]; ");
            graph = "";
            Generar(raiz);
            f.Write(graph);
            f.Write("}");
            f.Close();

        }

        public void Generar(ParseTreeNode raiz)
        {
            graph = graph + "nodo" + raiz.GetHashCode() + "[label=\"" + raiz.ToString().Replace("\"", "\\\"") + " \", style =\"filled\", shape=\"box\"]; \n";
            if (raiz.ChildNodes.Count > 0)
            {
                ParseTreeNode[] hijos = raiz.ChildNodes.ToArray();
                for (int i = 0; i < raiz.ChildNodes.Count; i++)
                {
                    Generar(hijos[i]);
                    graph = graph + "\"nodo" + raiz.GetHashCode() + "\"-> \"nodo" + hijos[i].GetHashCode() + "\" \n";
                }
            }
        }
        
        private static void GenerateGraph(string fileName, string path)
        {
            try
            {
                var command = string.Format("dot -Tjpg {0} -o {1}", Path.Combine(path, fileName), Path.Combine(path, fileName.Replace(".txt", ".jpg")));
                var procStartInfo = new System.Diagnostics.ProcessStartInfo("cmd", "/C " + command);
                var proc = new System.Diagnostics.Process();
                proc.StartInfo = procStartInfo;
                proc.Start();
                proc.WaitForExit();
            }
            catch (Exception x)
            {
                System.Diagnostics.Debug.WriteLine(x.ToString());
            }
        }
    }
}
