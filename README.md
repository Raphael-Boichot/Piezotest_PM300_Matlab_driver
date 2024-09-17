# Matlab codes to calibrate and make measurements with a [PM300 PiezoMeter system](https://www.piezotest.com/d33piezometer.php)

## Why ?

Because measuring the d33 piezoelectric coefficient in thin films is harder than it looks, I have developped a series of codes to calibrate a PM300 PiezoMeter system and make accurate measurements. The device can of course be used directly from the front panel in "one shot" mode, but we found that measuring the d33 for a longer period of time, automatically with the serial port, give a better accuracy/repeatability.

The device is delivered without any example code, but the protocol is very easy to implement (I do not remind where I found it, must be on the vendor website or given on a sheet of paper with the machine).

**You will notice lot of dead times during measurements: they are here on purpose.** It's a slow process, the d33 measure drifts during several dozens of seconds before stabilizing. This is not due to the PM300 meter but an artifact of the quasi-static Berlincourt method used here (exact reason physical is unknown). These codes were optimized after days of trial an errors, so you can safely rely on the timing proposed here.

## What do the codes ?

- **Piezotest_PM300_calibration.m** makes an automatic calibration bu using the standardized samples given by the device manufacturer. This is possible ONLY by using the serial port and is mandatory before each measurement campaign ;
- **Piezotest_PM300_reader.m** automates the d33 reading of a sample by taking and averaging 20 measurements ;
- **Piezotest_PM300_calibration_reader.m** automates both processes.

These codes can be very easily ported to [GNU Octave](https://octave.org/) in case you do not own a Matlab License.

## Funfact

The best reference for calibrating the "zero" we ever found was the business card of a political commissar I met in China during my short career as a "flying professor". I do not know if this is a first order parameter in the measurement but if it is, good luck.  

## Acknowledgements

Author wants to thanks [Juan Su](https://www.researchgate.net/profile/Juan-Su-5) for her endless patience using this code and the PM300 meter.
