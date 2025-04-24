package org.example;

import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class TicTacToe {
    int turn = 0; // 0 = O, 1 = X
    private static final Map<JButton, Integer> buttonFlags = new HashMap<>();
    private final int[] board = new int[9];

    public TicTacToe() {
        // Initialize board with -1 (empty)
        Arrays.fill(board, -1);

        JFrame frame = new JFrame("TicTacToe");
        frame.setLayout(new BorderLayout());
        frame.setSize(300, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel buttonPanel = new JPanel(new GridLayout(3, 3));
        Border lineBorder = BorderFactory.createLineBorder(Color.black, 2);

        for (int i = 0; i < 9; i++) {
            JButton button = new JButton();
            button.setFont(new Font("Arial", Font.BOLD, 40));
            button.setBorder(lineBorder);
            final int index = i;

            button.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (!buttonFlags.containsKey(button)) {
                        if (turn == 0) {
                            button.setText("O");
                            board[index] = 0;
                            turn = 1;
                            buttonFlags.put(button, 0);
                        } else {
                            button.setText("X");
                            board[index] = 1;
                            turn = 0;
                            buttonFlags.put(button, 1);
                        }

                        String result = checkGameState(board);
                        if (!result.equals("Game continues")) {
                            JOptionPane.showMessageDialog(frame, result);
                        }
                    }
                }
            });

            buttonPanel.add(button);
        }

        frame.add(buttonPanel);
        frame.setVisible(true);
        frame.setFocusable(true);
    }

    public static String checkGameState(int[] board) {
        int[][] winPatterns = {
                {0, 1, 2}, {3, 4, 5}, {6, 7, 8}, // rows
                {0, 3, 6}, {1, 4, 7}, {2, 5, 8}, // cols
                {0, 4, 8}, {2, 4, 6}             // diagonals
        };

        for (int[] pattern : winPatterns) {
            int a = board[pattern[0]];
            int b = board[pattern[1]];
            int c = board[pattern[2]];
            if (a != -1 && a == b && b == c) {
                return a == 1 ? "Player X wins!" : "Player O wins!";
            }
        }

        for (int value : board) {
            if (value == -1) {
                return "Game continues";
            }
        }

        return "It's a draw!";
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(TicTacToe::new);
    }
}
