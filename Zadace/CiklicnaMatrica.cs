using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UcenjeCS
{
    internal class CiklicnaMatrica
    {
        static void Run ()
        {
            do
            {
                int redovi = UnosBroja("Unesite broj redova (2-50): ", 2, 50);
                int stupci = UnosBroja("Unesite broj stupaca (2-50): ", 2, 50);
                int opcija = UnosBroja("Odaberite opciju (1-16): ", 1, 16);

                int[,] matrica = GenerirajMatricu(redovi, stupci, opcija);
                IspisiMatricu(matrica);

                Console.Write("Želite li generirati još jednu matricu? (da/ne): ");
            } while (Console.ReadLine().ToLower() == "da");
        }

        static int UnosBroja(string poruka, int min, int max)
        {
            int broj;
            do
            {
                Console.Write(poruka);
                if (!int.TryParse(Console.ReadLine(), out broj) || broj < min || broj > max)
                {
                    Console.WriteLine($"Molimo unesite broj između {min} i {max}.");
                }
            } while (broj < min || broj > max);
            return broj;
        }

        static int[,] GenerirajMatricu(int redovi, int stupci, int opcija)
        {
            int[,] matrica = new int[redovi, stupci];
            int broj = 1;
            int gornji = 0, donji = redovi - 1, lijevi = 0, desni = stupci - 1;
            int smjer = opcija <= 8 ? 1 : -1;

            Func<int, int, bool> uvjet = (i, j) => true;
            Action<int, int> postavi = (i, j) => matrica[i, j] = broj++;

            switch (opcija)
            {
                case 1: case 5: uvjet = (i, j) => i == gornji && j == lijevi; break;
                case 2: case 6: uvjet = (i, j) => i == gornji && j == desni; break;
                case 3: case 7: uvjet = (i, j) => i == donji && j == lijevi; break;
                case 4: case 8: uvjet = (i, j) => i == donji && j == desni; break;
                case 9: case 13: uvjet = (i, j) => i == (gornji + donji) / 2 && j == lijevi; break;
                case 10: case 14: uvjet = (i, j) => i == (gornji + donji) / 2 && j == desni; break;
                case 11: case 15: uvjet = (i, j) => i == gornji && j == (lijevi + desni) / 2; break;
                case 12: case 16: uvjet = (i, j) => i == donji && j == (lijevi + desni) / 2; break;
            }

            while (gornji <= donji && lijevi <= desni)
            {
                for (int j = lijevi; j <= desni; j++) if (uvjet(gornji, j)) postavi(gornji, j);
                gornji++;

                for (int i = gornji; i <= donji; i++) if (uvjet(i, desni)) postavi(i, desni);
                desni--;

                if (gornji <= donji)
                {
                    for (int j = desni; j >= lijevi; j--) if (uvjet(donji, j)) postavi(donji, j);
                    donji--;
                }

                if (lijevi <= desni)
                {
                    for (int i = donji; i >= gornji; i--) if (uvjet(i, lijevi)) postavi(i, lijevi);
                    lijevi++;
                }

                if (smjer == -1) broj = redovi * stupci - broj + 2;
            }

            return matrica;
        }

        static void IspisiMatricu(int[,] matrica)
        {
            int redovi = matrica.GetLength(0);
            int stupci = matrica.GetLength(1);

            for (int i = 0; i < redovi; i++)
            {
                for (int j = 0; j < stupci; j++)
                {
                    Console.Write($"{matrica[i, j],4}");
                }
                Console.WriteLine();
            }
        }
    }
}