using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JBecerraExamenGrupoReforma
{
    class Program
    {
        static void Main(string[] args)
        {
            DatosXML.DesarializarXML();
        }
        public void A()
        {
            int[,] matriz1 = new int[3, 3] { {1,2,3},
                                             {4,5,6},
                                             {7,8,9}
                                           };
            int[,] matriz2 = new int[3, 3] { {1,1,1},
                                             {5,6,1},
                                             {7,8,1}
                                           };

            int[,] matriz3 = new int[3, 3];

            for (int i = 0; i < 3; i++)
            {
                for (int j = 0; j < 3; j++)
                {
                    matriz3[i, j] = matriz1[i, j] + matriz2[i, j];
                    Console.WriteLine(matriz3[i, j]);
                }
                Console.WriteLine("\n");
            }

            Console.ReadKey();
        }
        public static void B()
        {
            Console.WriteLine("Ingrese un numero: ");
            int numero = int.Parse(Console.ReadLine());

            int resultadofactorial = Factorial(numero);

            Console.WriteLine("El resultado es: " + resultadofactorial);
            Console.ReadKey();
        }
        public static int Factorial(int numero)
        {
            if (numero == 0)
            {
                return 1;
            }
            else
            {
                return numero * Factorial(numero - 1);
            }
        }
    }
}
