#include <stdio.h>
#include <iostream>

extern "C" double foo(double** X, size_t N, size_t M, int i, int j);
extern "C" void printDouble(double x);

double initAndPrint(double** p, int N, int M)
{
  for (int i = 0; i < N; i++)
  {
      p[i] = new double[M];
      for (int j = 0; j < M; j++)
      {
          p[i][j] = (double)(j)/(i+1);
          printf("%f ", p[i][j]);
      }
      printf("\n");
  }
  return 0;
}

void printDouble(double x)
{
    printf("%.6f\n", x);
}

///////////////////////////////////////////
int main()
{
  const int N = 6;
  const int M = 6;
  const int i = 0;
  const int j = 1;

  double** k = new double*[N];
  printf("foo(A, %i, %i, %i, %i) in matrix:\n", N, M, i, j);
  initAndPrint(k,N,M);
  double z = foo(k, N, M, i, j);

  printf("Answer: %.9f\n", z);
  return 0;

  for (int i = 0; i < N; i++)
      delete[] k[i];
  delete[] k;
}
