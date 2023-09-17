import math

class Rotation:

    @staticmethod
    def rotate_point_x(x, y, z, angle):
        angle_rad = math.radians(angle)
        new_y = y * math.cos(angle_rad) - z * math.sin(angle_rad)
        new_z = y * math.sin(angle_rad) + z * math.cos(angle_rad)
        return x, new_y, new_z
    
    @staticmethod
    def rotate_point_y(x, y, z, angle):
        angle_rad = math.radians(angle)
        new_x = x * math.cos(angle_rad) - z * math.sin(angle_rad)
        new_z = x * math.sin(angle_rad) + z * math.cos(angle_rad)
        return new_x, y, new_z
    