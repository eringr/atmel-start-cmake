#include <atmel_start.h>
#include <hal_delay.h>
#include <hal_gpio.h>

int main(void)
{
    atmel_start_init();

    gpio_set_pin_direction(6, GPIO_DIRECTION_OUT);
    while (1) {
        gpio_toggle_pin_level(6);
        delay_ms(200);
    }
}
