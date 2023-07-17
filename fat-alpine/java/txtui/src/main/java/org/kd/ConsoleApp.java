package org.kd;

import com.googlecode.lanterna.TerminalPosition;
import com.googlecode.lanterna.TerminalSize;
import com.googlecode.lanterna.TextColor;
import com.googlecode.lanterna.gui2.*;
import com.googlecode.lanterna.gui2.dialogs.MessageDialog;
import com.googlecode.lanterna.screen.Screen;
import com.googlecode.lanterna.screen.TerminalScreen;
import com.googlecode.lanterna.terminal.DefaultTerminalFactory;
import com.googlecode.lanterna.terminal.Terminal;

import java.util.logging.Logger;
import java.util.logging.Level;

public class ConsoleApp {

	private static final Logger LOGGER = Logger.getLogger(ConsoleApp.class.getSimpleName());

	private static BasicWindow createWindow(){
		// Create window
        BasicWindow window = new BasicWindow("Console App");
        Panel contentPanel = new Panel();
        window.setComponent(contentPanel);

        // Add components to the panel
        contentPanel.setLayoutManager(new GridLayout(2));
        contentPanel.addComponent(new Label("Hello, World!"));

        // Create a panel and add buttons
        Panel panel = new Panel();
        panel.setLayoutManager(new LinearLayout(Direction.VERTICAL));
        panel.addComponent(new Button("Button 1", () -> LOGGER.log(Level.INFO, "Button 1 clicked")));
        panel.addComponent(new Button("Button 2", () -> showMessage("Button 2 clicked!")));
        panel.addComponent(new Button("Exit", () -> window.close()));

        contentPanel.addComponent(panel);
		
		return window;
	}

    public static void main(String[] args) {
        try {
            // Initialize terminal
            Terminal terminal = new DefaultTerminalFactory().createTerminal();

            // Initialize screen
            Screen screen = new TerminalScreen(terminal);
            screen.startScreen();

			var window = createWindow();
            // Create GUI and start GUI loop
            MultiWindowTextGUI gui = new MultiWindowTextGUI(screen, new DefaultWindowManager(),
                    new EmptySpace(TextColor.ANSI.BLUE));
            gui.addWindowAndWait(window);

            // Close the screen when done
            screen.stopScreen();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void showMessage(String message) {
        MessageDialog.showMessageDialog(null, "Message", message);
    }
}
