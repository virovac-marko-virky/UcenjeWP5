﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UcenjeCS
{
    internal class E11Z1
    {

        public static void Izvedi()
        {
            // Program učitava dva broja i ispisuje zbroj
            Console.WriteLine(
                E11Metode.UcitajCijeliBroj("Unesi prvi broj",int.MinValue,int.MaxValue) +
                E11Metode.UcitajCijeliBroj("Unesi drugi broj", int.MinValue, int.MaxValue));
        }
    }
}
