#include <at89x52.h>
unsigned  char str[] = "_hello world!\t";

enum count {
    NUM_ELE =  14,

};

void main(void)
{

  int i;
	TMOD = 0x20;   // 12MHz 2400bps
	TH1 = 0xF3;
	TL1 = 0xf3;
	SCON = 0x50;
	TR1 = 1;
	while (1) {
      for ( i = 0; i < NUM_ELE ; i++ ) {
			SBUF = str[i];
			while (TI == 0) ;
			TI = 0;
		}
	}
}
