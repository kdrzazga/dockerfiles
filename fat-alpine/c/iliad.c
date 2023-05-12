#include <stdio.h>

int main() {

    char* englishText = "Sing, O goddess, the anger of Achilles son of Peleus,\n"
                        "that brought countless ills upon the Achaeans.\n"
                        "Many a brave soul did it send hurrying down to Hades,\n"
                        "and many a hero did it yield a prey to dogs\n"
                        "and vultures, for so were the counsels of Jove fulfilled\n"
                        "from the day on which the son of Atreus,\n"
                        "king of men, and great Achilles, first fell out with one another.";

    char* greekText = "Μῆνιν ἄειδε, θεὰ, Πηληϊάδεω Ἀχιλῆος\n"
                      "οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,\n"
                      "πολλὰς δ᾽ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν\n"
                      "ἡρώων, αὐτοὺς δὲ ἑλώρια τεῦχε κύνεσσιν\n"
                      "οἰωνοῖσί τε πᾶσι, Διὸς δ᾽ ἐτελείετο βουλή,\n"
                      "ἐξ οὗ δὴ τὰ πρῶτα διαστήτην ἐρίσαντε\n"
                      "Ἀτρεΐδης τε ἄναξ ἀνδρῶν καὶ δῖος Ἀχιλλεύς.";


    printf("ILLIAD\nEnglish:\n%s\n\n", englishText);

    printf("Ιλιάδα\nGreek:\n%s\n", greekText);

    return 0;
}
