extends Node
class_name Pilot


signal throttle(value)  # sends whether the pilot wants to accelerate (1), brake (-1), or drift at current speed (0)
signal turn(value)  # sends whether the pilot wants to turn left(-1), right (1), or straight (0)
