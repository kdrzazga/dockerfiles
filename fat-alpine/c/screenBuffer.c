#include <stdio.h>
#include <unistd.h>

int main() {
    printf("\033[7h"); // Enable screen capture
    printf("\033[?47h"); // Switch to alternate screen buffer

    // Print the entire screen
    printf("\033[2J"); // Clear the screen
    printf("\033[H"); // Move the cursor to the home position

    sleep(1); // 1-second delay

    // Capture the screen contents
    printf("\033[?1049h"); // Save the screen to an alternate buffer
    sleep(3); // 1-second delay
	printf("\n\nSCREEN WAS SAVED BEFORE CLEARING\n");
	printf("AND WILL BE RESORED IN 3 seconds\n\n\n\n\n\n");
    printf("1.1 Prima est scientia avium, quam falconaria vocant, in qua debet falconarius scire ordinem avium, tempora venationis earum et consuetudinem\n");

    printf("11.2 Avicula est avis rapax, volatilis, feris inimica, quae bonam et idoneam venationem fecit sapientibus nostris, propter quod etiam multum in ea peccat ignorans.\n");

    printf("11.3 Quaedam enim sunt aves volucres de rapacitate sua naturali in cibus delectabiles, sed habent alias aves simpliciores, ut columbam et turturam, parviores, sed uberiores de carne et naturaliter simpliciores de plumis.\n");
	
    sleep(1); // 1-second delay
    printf("\033[?1049l"); // Restore the screen from the alternate buffer
    sleep(1); // 1-second delay

	printf("1.4 Et haec simpliciores aves plerumque aluntur auras generosius; generosius enim alitur avis inter aves quae in libertate vivit, sicut ad patrem suum, cum aves mitescunt, tendunt in montem et in ligna, ubi spirant auras et non in valle; et ob id generosiores dicuntur aves, quia mitescunt ad patrem suum.");
	
    printf("\033[?47l"); // Switch back to the normal screen buffer
    printf("\033[7l"); // Disable screen capture

    return 0;
}
