Pendulum on a Cart Example
===

The state equations for this problem are from Friedland's book, _Control System Design: An Introduction to State-Space Methods_, pg 30. It can be found here: http://goo.gl/tWj4vn

![diagram](pendulum_diagram.png)

![diagram](pendulum_eqns.png)

* pendulumOnACart
  * simplest system. SISO, with PID control on theta_err
* pendulumOnACart_MIMO
  * multiple input (force, torque) and multiple output (y, theta). PD control
* pendulumOnACart_observer_PD
  * observer to estimate state. PD control around theta
* pendulumOnACart_observer_PID
  * observer, as above, but an additional state to allow for PID control
* pendulumOnACart_observer_MIMO
  * MIMO with observer and PD control
