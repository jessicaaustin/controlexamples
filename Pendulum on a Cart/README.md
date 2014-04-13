Pendulum on a Cart Example
===

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
