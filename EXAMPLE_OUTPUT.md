# Example Output

This file shows what the output of `markov.pl` looks like when run.

## Running the Script

When you run the script, you'll first see statistics about the loaded files:

```
Loading lyrics files...
------------------------------------------------------------
wildestdreams.txt        39 lines,   278 words
22.txt                   45 lines,   312 words
bothofus.txt             32 lines,   189 words
badblood.txt             38 lines,   267 words
eyesopen.txt             41 lines,   285 words
blankspace.txt           44 lines,   298 words
trouble.txt              36 lines,   241 words
shake.txt                42 lines,   305 words
oursongs.txt             35 lines,   223 words
never.txt                40 lines,   276 words
mean.txt                 37 lines,   248 words
lovestory.txt            43 lines,   291 words
------------------------------------------------------------
Total words processed: 3213

Generating text using Markov chains...
============================================================

[Generated lines appear here - each line is a randomly generated
sentence based on the Markov chain patterns learned from the lyrics]

============================================================
Generation complete!
```

## Sample Generated Text

The generated output will consist of multiple lines of text that follow patterns from the source material. Each line will contain words arranged in sequences that the Markov chain algorithm determined were likely to appear together based on the training data.

The quality and coherence of the output depends on:
- The `--chain-length` parameter (higher = more coherent)
- The `--length` parameter (words per line)
- The variety in the source material

## Tips for Best Results

1. **For more coherent output**: Use a higher chain length (4-5)
   ```bash
   perl markov.pl --chain-length 5
   ```

2. **For more creative/random output**: Use a lower chain length (1-2)
   ```bash
   perl markov.pl --chain-length 2
   ```

3. **To generate more text**: Increase the number of lines
   ```bash
   perl markov.pl --lines 50
   ```

4. **For longer sentences**: Increase the words per line
   ```bash
   perl markov.pl --length 20
   ```

