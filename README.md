# Taylor Swift Markov Chain Text Generator

A Perl-based text generator that uses Markov chains to create random text based on patterns from Taylor Swift song lyrics.

## Overview

This project demonstrates the use of Markov chains for natural language generation. By analyzing word patterns in Taylor Swift's lyrics, it generates new, random text that mimics the style and vocabulary of the input data.

## How It Works

1. **Data Collection**: Reads lyrics from text files in the `libs/` directory
2. **Pattern Analysis**: Builds a Markov chain model based on word sequences
3. **Text Generation**: Creates new text by following probabilistic patterns from the original lyrics

A Markov chain is a mathematical system that transitions from one state to another based on probabilistic rules. In this case, each "state" is a word, and the chain predicts the next word based on the previous words.

## Prerequisites

- Perl 5.10 or higher
- Required CPAN modules:
  - `Algorithm::MarkovChain`
  - `Path::Class`
  - `Getopt::Long`
  - `Pod::Usage`

## Installation

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd TaylorSwiftMarkovChains
   ```

2. Install required Perl modules:
   ```bash
   cpan Algorithm::MarkovChain Path::Class
   ```
   
   Or using `cpanm`:
   ```bash
   cpanm Algorithm::MarkovChain Path::Class
   ```

## Usage

### Basic Usage

Run the script with default settings:
```bash
perl markov.pl
```

### Command Line Options

```bash
perl markov.pl [OPTIONS]

Options:
  --lines NUM          Number of lines to generate (default: 14)
  --length NUM         Words per line (default: 10)
  --chain-length NUM   Markov chain length (default: 3)
  --help              Show help message
```

### Examples

Generate 20 lines of text:
```bash
perl markov.pl --lines 20
```

Generate longer sentences (15 words each):
```bash
perl markov.pl --length 15
```

Use a longer chain length for more coherent text:
```bash
perl markov.pl --chain-length 4
```

Combine options:
```bash
perl markov.pl --lines 30 --length 12 --chain-length 4
```

## GitHub Actions Workflow

This project includes an automated GitHub Actions workflow that:

### Triggers
- **Manual Dispatch**: Run the workflow manually with custom parameters
- **Push Events**: Automatically runs when code is pushed to main/master
- **Pull Requests**: Tests changes in PRs
- **Scheduled**: Runs daily at 9:00 AM UTC to generate fresh lyrics

### Features

#### 🎯 Matrix Testing
Tests against multiple Perl versions (5.32, 5.34, 5.36) to ensure compatibility.

#### 🎨 Multiple Generation Modes
- Default generation with standard parameters
- Custom parameters (when manually triggered)
- Creative variations (short chain length)
- Coherent variations (long chain length)

#### 📦 Artifact Storage
Generated text files are saved as artifacts for 30 days, allowing you to download and review the output.

#### 🔍 Code Quality
Separate linting job that:
- Runs Perl::Critic for code quality checks
- Validates syntax with `perl -c`

### Manual Workflow Dispatch

To run the workflow manually with custom parameters:

1. Go to the **Actions** tab in your GitHub repository
2. Select **Taylor Swift Markov Chain Generator**
3. Click **Run workflow**
4. Enter your custom parameters:
   - Number of lines to generate
   - Words per line
   - Markov chain length
5. Click **Run workflow**

The workflow will generate text with your specifications and upload the results as downloadable artifacts.

### Viewing Results

After the workflow completes:
- Check the **Summary** page for a preview of generated text
- Download artifacts from the workflow run page
- View the complete output in the job logs

## Project Structure

```
TaylorSwiftMarkovChains/
├── .github/
│   └── workflows/
│       └── markov-generator.yml  # GitHub Actions workflow
├── libs/                  # Directory containing lyrics files
│   ├── 22.txt
│   ├── badblood.txt
│   ├── blankspace.txt
│   ├── bothofus.txt
│   ├── eyesopen.txt
│   ├── lovestory.txt
│   ├── mean.txt
│   ├── never.txt
│   ├── oursongs.txt
│   ├── shake.txt
│   ├── trouble.txt
│   └── wildestdreams.txt
├── markov.pl              # Main script
├── .gitignore             # Git ignore file
├── EXAMPLE_OUTPUT.md      # Example output documentation
└── README.md              # This file
```

## Understanding Markov Chains

The chain length parameter controls how many previous words the algorithm considers when choosing the next word:

- **Chain length 1**: Each word depends only on the previous word (less coherent)
- **Chain length 2-3**: Balances coherence and creativity (default)
- **Chain length 4+**: More coherent but less creative output

## Educational Purpose

This project is created for educational purposes to demonstrate:
- Markov chain algorithms
- Natural language processing basics
- Text pattern analysis
- Probabilistic text generation

## License

This project is for educational and non-commercial use only. The song lyrics are copyrighted material owned by their respective copyright holders.

## Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Improve documentation
- Add new training data

## Acknowledgments

- Uses the `Algorithm::MarkovChain` Perl module
- Inspired by classic Markov chain text generators
- Taylor Swift for the source material

## Disclaimer

This is an educational project. All song lyrics are copyrighted by their respective owners. This project does not claim any ownership of the lyrics used for text generation.

