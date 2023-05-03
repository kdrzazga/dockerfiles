// Import the required modules
import std.stdio;
import std.math;
import mir.algorithm.trigonometric : sin, cos, tan, atan;

void main()
{
    // Define the angle in radians
    double angle = 0.5;

    // Calculate the sine, cosine, and tangent of the angle
    double sine = sin(angle);
    double cosine = cos(angle);
    double tangent = tan(angle);

    // Calculate the arctangent of the tangent
    double arctan = atan(tangent);

    // Print the results
    writeln("Angle: ", angle);
    writeln("Sine: ", sine);
    writeln("Cosine: ", cosine);
    writeln("Tangent: ", tangent);
    writeln("Arctangent: ", arctan);
}
