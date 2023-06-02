package org.kd.view;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.kd.model.config.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@Import(Config.class)
public class CommandParserTest {

    @Autowired
    private CommandParser parser;// = new CommandParser();

    private final String moveCommand = "move 1a01, 2g07";
    private final String recruitCommand = "recruit barracks1, archer";
    private final String statusCommand = "status barracks1";
    private final String endCommand = " end ";
    private final String fakeCommand = "Litwo Ojczyzno moja ";

    @Test
    public void testParsingCommand() {

        parser.parse(moveCommand);
        assertEquals(parser.getCommand().toString(), "move");

        parser.parse(recruitCommand);
        assertEquals(parser.getCommand().toString(), "recruit");

        parser.parse(statusCommand);
        assertEquals(parser.getCommand().toString(), "status");
    }

    @Test
    public void testParsingArguments() {

        parser.parse(moveCommand);
        assertTrue(parser.validateArguments());

        parser.parse(statusCommand);
        assertTrue(parser.validateArguments());
    }

    @Test
    public void testCommandValidation() {
        parser.parse(fakeCommand);
        assertFalse(parser.validateCommand());

        parser.parse(recruitCommand);
        assertTrue(parser.validateCommand());
    }
}
