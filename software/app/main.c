#include "sys/alt_stdio.h"
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>                              // usleep()
#include "system.h"                             
#include "altera_avalon_pio_regs.h"            

int main(void)
{
    alt_printf("Hello \n");   // pour vérifier
    int paused = 0;            
    int previous_key = 1;     
    int led_counter = 0;       

    while (1)
    {
      
        int current_key = IORD_ALTERA_AVALON_PIO_DATA(BUTTON_BASE);
        int switch_val = IORD_ALTERA_AVALON_PIO_DATA(SW_BASE);

   
        if (previous_key == 1 && current_key == 0) {  // polling
            paused = !paused;  
        }

        previous_key = current_key;


        if (!paused) {
            led_counter++;
        }


        int j = led_counter % 8;


        usleep(switch_val * 30000);


        IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 1 << j);

        usleep(switch_val * 30000);
    }

    return 0;
}