using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _Compi1_HT3_201503440
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Analizador ht3 = new Analizador();
            if (ht3.Valida(textBox1.Text, new Sintactico()))
            {
                MessageBox.Show("EL RESULTADO ES: "+ht3.resultado.ToString());
                textBox1.Text = "";
            }
            else
            {
                MessageBox.Show("Invalido ");

            }
        }
    }
}
