#include "TempRadio.h"

configuration SenderAppC{
}
implementation{
	components SenderC as AppC;
	components MainC, LedsC;
	components new TimerMilliC() as TimerMilli;
	components ActiveMessageC as AM;
	components new SensirionSht11C() as Sht;
	components new HamamatsuS1087ParC() as LightC;

	AppC.Boot -> MainC.Boot;
	AppC.Leds -> LedsC.Leds;
	AppC.Control -> AM.SplitControl;
	AppC.Receive -> AM.Receive[AM_TEMPERATURE_MSG];
	AppC.AMSend -> AM.AMSend[AM_TEMPERATURE_MSG];
	AppC.Packet -> AM.Packet;
	AppC.Timer -> TimerMilli.Timer;
	AppC.Temperature -> Sht.Temperature;
	AppC.Humidity -> Sht.Humidity;
	AppC.Light -> LightC;
}
