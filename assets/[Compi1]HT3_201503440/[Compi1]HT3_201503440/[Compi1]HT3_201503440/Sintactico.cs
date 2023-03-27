using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Irony.Parsing;
using Irony.Ast;


namespace _Compi1_HT3_201503440
{
    class Sintactico: Grammar
    {
        public Sintactico() {
            //Expresiones regulares
            RegexBasedTerminal numero = new RegexBasedTerminal("entero", "[0-9]+");
            RegexBasedTerminal doble  = new RegexBasedTerminal("doble", "[0-9]+\\.[0-9]+");

            var mas   = ToTerm("+");
            var menos = ToTerm("-");
            var por   = ToTerm("*");
            var div   = ToTerm("/");
            var elev  = ToTerm("^");

            this.RegisterOperators(1, Associativity.Left, mas, menos);
            this.RegisterOperators(2, Associativity.Left, por, div);
            this.RegisterOperators(3, Associativity.Left, elev);

            NonTerminal S = new NonTerminal("S"),
                        E = new NonTerminal("E");

            S.Rule = E;

            E.Rule =  E + mas + E
                    | E + menos + E
                    | E + div + E
                    | E + por + E
                    | E + elev + E
                    | numero
                    | doble
                    | ToTerm("(") + E + ToTerm(")");

            /*
            T.Rule = T + "+" + F
                   | T + "-" + F
                   | F;

            F.Rule = F + "/" + G
                | F + "*" + G
                | G;

            G.Rule = G + "^" + H
                | H;
            */

            this.Root = S;

            //Estos simbolos se van a omitir
            MarkPunctuation("(", ")");//Quitar nodos inservibles
        }
    }
    // 12*12+12/2
}
