int calculaIndice(int valor); 

double trata(int u); 

 

float foo (int v[], int n) {  

   double m = 1.0; 

   int i; 

   int indice; 

  

   for(i=0; i< n; i++) { 

      indice = calculaIndice(i); 

      m *= trata(v[indice]); 

   } 

   return m; 

} 