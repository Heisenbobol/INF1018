#define BIGINT_SIZE 128
typedef int BigInt[BIGINT_SIZE];

/* res = a + b */

/**
 * Função que soma dois números representados como BigInt.
 * Funcionamento:
 * 
 * - Cada BigInt é um array de inteiros, onde cada inteiro representa
 * um dígito do número, armazenado em ordem inversa (o dígito menos significativo
 * está na posição 0).
 * 
 * - A função percorre cada dígito dos dois números, somando-os junto com
 * qualquer "vai-um" (carry) da soma anterior.
 * 
 * - Se a soma de dois dígitos mais o carry for 10 ou mais,
 * o carry é ajustado para 1 e o dígito resultante é reduzido em 10.
 * 
 * - O resultado é armazenado no array `res`.
 * 
 * - A função assume que os arrays `a`, `b` e `res` têm tamanho BIGINT_SIZE.
 * 
 * - Não há verificação de overflow; se a soma exceder a capacidade de BIGINT_SIZE,
 * os dígitos mais significativos serão descartados.
 * 
 * @brief Sums two BigInt numbers and stores the result in a third BigInt.
 * @param res The BigInt to store the result.
 * @param a The first BigInt operand.
 * @param b The second BigInt operand.
 */
void big_sum(BigInt res, BigInt a, BigInt b) {
    int carry = 0;  // inicializa variável com 0
    int i;
    for (i = 0; i < BIGINT_SIZE; i++) {
        int sum = a[i] + b[i] + carry;
        if (sum >= 10) {
            carry = 1;  // se o resultado é maior do que 10, então o carry é 1
            sum -= 10;
        } else {
            carry = 0;
        }
        res[i] = sum;
    }
}