# Matlab codes to calibrate and make measurements with a [PM300 PiezoMeter system](https://www.piezotest.com/d33piezometer.php)

## Why ?

Because mesauring the d33 piezoelectric coefficient is harder than it looks, I have developped a series of codes to calibrate a PM300 PiezoMeter system and make accurate measurements with thin films. The device can of course be used directly from the front panel in "one shot" mode, but we found that measuring the d33 for a longer period of time, automatically with the serial port, give a better accuracy.

The device is delivered without any example code, but the protocol is very easy to implement (I do not remind where I found it, must be on the vendor website)

## What do the codes ?

- **Piezotest_PM300_calibration.m** makes an automatic calibration bu using the standardized samples given by the device manufacturer. This is possible ONLY by using the serial port and is mandatory before each measurement campaign ;
- **Piezotest_PM300_reader.m** automates the d33 reading of a sample by taking and averaging 20 measurements ;
- **Piezotest_PM300_calibration_reader.m** automates both processes.

These codes can be very easily ported to [GNU Octave](https://octave.org/) in case you do not own a Matlab License.

## Acknowledgements

Author wants to thanks [Juan Su](https://www.researchgate.net/profile/Juan-Su-5) for her endless patience using this code and the PM300 meter.
