# Nano Processor Instruction Manual

## 1. Overview

The nano processor executes 12-bit instructions stored in a program ROM. Each instruction is decoded by the instruction decoder and controls the datapath, register bank, arithmetic logic unit (ALU), and program flow.

---

## 2. Instruction Format

Each instruction is 12 bits wide and structured as follows:

| Bits   | Field Name      | Description                                 |
|--------|----------------|---------------------------------------------|
| 11     | Load_Select     | 1: Immediate mode, 0: Register/ALU operation|
| 10     | Add_Sub_Select  | 1: SUB/NEG/JZR, 0: ADD/MOVI                 |
| 9..7   | R_A / Dest_Reg  | Register A / Destination Register           |
| 6..4   | R_B_Select      | Register B / Source Register                |
| 3..0   | Imd_Val / Addr  | Immediate value or Jump address             |

---

## 3. Instruction Set

| Mnemonic      | Binary Pattern      | Description                                 |
|---------------|--------------------|---------------------------------------------|
| MOVI Rd, Imm  | 1 0 ddd xxx iiii   | Move immediate value `iiii` to register `ddd`|
| NEG Rd        | 0 1 ddd xxx 0000   | Negate the value in register `ddd`          |
| ADD Rd, Rs    | 0 0 ddd sss 0000   | Add register `sss` to `ddd`                 |
| SUB Rd, Rs    | 0 1 ddd sss 0000   | Subtract `sss` from `ddd`                   |
| JZR Rc, Addr  | 1 1 ccc xxx aaaa   | If `Rc == 0`, jump to address `aaaa`        |
| END           | 1 1 000000000000   | Halt the program (by convention)            |

**Legend:**

- `ddd` = destination register (R0–R7)
- `sss` = source register (R0–R7)
- `iiii` = 4-bit immediate value
- `aaaa` = 4-bit jump address

---

### Example Instructions from ROM

| Address | Instruction   | Binary        | Description                    |
|---------|--------------|--------------|--------------------------------|
| 0       | MOVI R7, 10  | 101110000010 | R7 ← 10                        |
| 1       | MOVI R2, 1   | 100100000001 | R2 ← 1                         |
| 2       | NEG R2       | 010100000000 | R2 ← -R2                       |
| 3       | ADD R7, R2   | 001110100000 | R7 ← R7 + R2                   |
| 4       | JZR R7, 7    | 111110000111 | If R7 == 0, jump to address 7  |
| 5       | JZR R0, 3    | 110000000011 | If R0 == 0, jump to address 3  |
| 6       | JZR R1, 7    | 111110000111 | If R1 == 0, jump to address 7  |
| 7       | END          | 110000000000 | Halt the program               |

---

## 4. Reset Function

The reset button is mapped in `basys3.xdc`.

**Functionality:**  
Pressing the reset button (connected to pin U18) resets the processor, clears all registers, and restarts execution from instruction 0 in ROM.

---

## 5. Output Signals

| Output Signal   | Description                                      |
|-----------------|--------------------------------------------------|
| Cathode_7Seg    | Displays the value of R7 on the 7-segment display|
| overflow        | Indicates if arithmetic overflow has occurred     |
| zero            | Set when the result of an operation is zero       |

---

## 6. Example Usage

To begin program execution:

1. Press the reset button (pin U18).
2. The processor will fetch and execute instructions sequentially from ROM.
3. R7’s value will be visible on the 7-segment display.
4. Status outputs `overflow` and `zero` will update according to operations.
