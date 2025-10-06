#include <stdio.h>
#include "fcgi_stdio.h"


int main() {
    FCGX_Init();
    while (FCGI_Accept() >= 0)
        {
            printf("Content-type: text/plain\r\n\r\n");
            printf("HELLO WORLD");
        }

    return 0;
}


// int main() {
//     FCGX_Init();
//     int socketId = FCGX_OpenSocket("127.0.0.1:8080", 20);
//     if (socketId < 0){
//         printf("Content-type: text/plain\r\n\r\n");
//         printf("Ошибка при открытии\n");
//         return 1;
//     }else {
//         while (FCGI_Accept() >= 0)
//         {
//             printf("Content-type: text/plain\r\n\r\n");
//             printf("HELLO WORLD");
//         }
        
//     }


//     return 0;
// }
