using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UcenjeCS
{
    internal class GeneratorLozinki
    {
        static Random random = new Random();

        public static void PokreniGenerator()
        {
            Console.WriteLine("Generator lozinki");
            Console.Write("Unesite dužinu lozinke: ");
            int duljina = int.Parse(Console.ReadLine());
            Console.Write("Uključiti velika slova? (da/ne): ");
            bool koristiVelika = Console.ReadLine().ToLower() == "da";
            Console.Write("Uključiti mala slova? (da/ne): ");
            bool koristiMala = Console.ReadLine().ToLower() == "da";
            Console.Write("Uključiti brojeve? (da/ne): ");
            bool koristiBrojeve = Console.ReadLine().ToLower() == "da";
            Console.Write("Uključiti interpunkcijske znakove? (da/ne): ");
            bool koristiInterpunkciju = Console.ReadLine().ToLower() == "da";
            Console.Write("Lozinka počinje s brojem? (da/ne): ");
            bool pocinjeBrojem = Console.ReadLine().ToLower() == "da";
            Console.Write("Lozinka počinje s interpunkcijskim znakom? (da/ne): ");
            bool pocinjeInterpunkcijom = Console.ReadLine().ToLower() == "da";
            Console.Write("Lozinka završava s brojem? (da/ne): ");
            bool zavrsavaBrojem = Console.ReadLine().ToLower() == "da";
            Console.Write("Lozinka završava s interpunkcijskim znakom? (da/ne): ");
            bool zavrsavaInterpunkcijom = Console.ReadLine().ToLower() == "da";
            Console.Write("Dozvoliti ponavljajuće znakove? (da/ne): ");
            bool dozvoljenoPonavljanje = Console.ReadLine().ToLower() == "da";
            Console.Write("Unesite broj lozinki za generiranje: ");
            int brojLozinki = int.Parse(Console.ReadLine());

            for (int i = 0; i < brojLozinki; i++)
            {
                string lozinka = GenerirajLozinku(duljina, koristiVelika, koristiMala, koristiBrojeve, koristiInterpunkciju,
                                                  pocinjeBrojem, pocinjeInterpunkcijom,
                                                  zavrsavaBrojem, zavrsavaInterpunkcijom, dozvoljenoPonavljanje);
                Console.WriteLine($"Lozinka {i + 1}: {lozinka}");
            }
        }

        static string GenerirajLozinku(int duljina, bool koristiVelika, bool koristiMala, bool koristiBrojeve, bool koristiInterpunkciju,
                                       bool pocinjeBrojem, bool pocinjeInterpunkcijom,
                                       bool zavrsavaBrojem, bool zavrsavaInterpunkcijom, bool dozvoljenoPonavljanje)
        {
            string znakovi = "";
            if (koristiVelika) znakovi += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            if (koristiMala) znakovi += "abcdefghijklmnopqrstuvwxyz";
            if (koristiBrojeve) znakovi += "0123456789";
            if (koristiInterpunkciju) znakovi += "!@#$%^&*()_+-=[]{}|;:,.<>?";

            if (string.IsNullOrEmpty(znakovi))
                return "Nije moguće generirati lozinku bez odabranih znakova.";

            while (true)
            {
                StringBuilder lozinka = new StringBuilder(duljina);
                for (int i = 0; i < duljina; i++)
                {
                    lozinka.Append(znakovi[random.Next(znakovi.Length)]);
                }

                if (pocinjeBrojem && !char.IsDigit(lozinka[0])) continue;
                if (pocinjeInterpunkcijom && !char.IsPunctuation(lozinka[0])) continue;
                if (zavrsavaBrojem && !char.IsDigit(lozinka[duljina - 1])) continue;
                if (zavrsavaInterpunkcijom && !char.IsPunctuation(lozinka[duljina - 1])) continue;
                if (!dozvoljenoPonavljanje && lozinka.ToString().Distinct().Count() != duljina) continue;

                return lozinka.ToString();
            }
        }
    }
}