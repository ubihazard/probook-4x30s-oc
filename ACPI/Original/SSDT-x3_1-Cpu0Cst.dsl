/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of Dump/SSDT-x3_1-Cpu0Cst.aml, Sun Oct 12 00:26:50 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000069C (1692)
 *     Revision         0x01
 *     Checksum         0xD2
 *     OEM ID           "PmRef"
 *     OEM Table ID     "Cpu0Cst"
 *     OEM Revision     0x00003001 (12289)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20060912 (537266450)
 */
DefinitionBlock ("", "SSDT", 1, "PmRef", "Cpu0Cst", 0x00003001)
{
    External (_PR_.CPU0, ProcessorObj)
    External (CFGD, IntObj)
    External (FMBL, IntObj)
    External (PDC0, IntObj)
    External (PFLV, FieldUnitObj)
    External (PWRS, FieldUnitObj)

    Scope (\_PR.CPU0)
    {
        Name (C1LM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x01,               // Bit Width
                    0x02,               // Bit Offset
                    0x0000000000000000, // Address
                    0x01,               // Access Size
                    )
            }, 

            0x01, 
            0x01, 
            0x03E8
        })
        Name (C1LH, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x00,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }, 

            0x01, 
            0x01, 
            0x03E8
        })
        Name (C3LM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x01,               // Bit Width
                    0x02,               // Bit Offset
                    0x0000000000000010, // Address
                    0x01,               // Access Size
                    )
            }, 

            0x02, 
            0x9C, 
            0x01F4
        })
        Name (C7SM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x01,               // Bit Width
                    0x02,               // Bit Offset
                    0x0000000000000031, // Address
                    0x01,               // Access Size
                    )
            }, 

            0x03, 
            0xC7, 
            0xC8
        })
        Name (C7LM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x01,               // Bit Width
                    0x02,               // Bit Offset
                    0x0000000000000030, // Address
                    0x01,               // Access Size
                    )
            }, 

            0x03, 
            0xC7, 
            0xC8
        })
        Name (C6LM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x01,               // Bit Width
                    0x02,               // Bit Offset
                    0x0000000000000020, // Address
                    0x01,               // Access Size
                    )
            }, 

            0x03, 
            0xB5, 
            0x015E
        })
        Name (C3LI, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000414, // Address
                    ,)
            }, 

            0x02, 
            0x9C, 
            0x01F4
        })
        Name (C6LI, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000415, // Address
                    ,)
            }, 

            0x03, 
            0xB5, 
            0x015E
        })
        Name (C7LI, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000416, // Address
                    ,)
            }, 

            0x03, 
            0xC7, 
            0xC8
        })
        Name (C3ST, Package (0x04)
        {
            0x03, 
            Package (0x00){}, 
            Package (0x00){}, 
            Package (0x00){}
        })
        Name (C2ST, Package (0x03)
        {
            0x02, 
            Package (0x00){}, 
            Package (0x00){}
        })
        Name (C1ST, Package (0x02)
        {
            0x01, 
            Package (0x00){}
        })
        Name (CSTF, 0x00)
        Method (_CST, 0, Serialized)  // _CST: C-States
        {
            If (LAnd (LNot (CSTF), And (CFGD, 0x00400000)))
            {
                Store (0x50, Index (C3LI, 0x02))
                Store (0x50, Index (C3LM, 0x02))
                Store (0x6D, Index (C7SM, 0x02))
                Store (0x6D, Index (C7LM, 0x02))
                Store (0x68, Index (C6LM, 0x02))
                Store (0x6D, Index (C7LI, 0x02))
                Store (0x68, Index (C6LI, 0x02))
                Store (Ones, CSTF)
            }

            If (LAnd (And (CFGD, 0x1000), And (PDC0, 0x0200)))
            {
                If (LOr (LNot (PWRS), LNotEqual (PFLV, FMBL)))
                {
                    If (And (CFGD, 0x00010000))
                    {
                        If (And (CFGD, 0x08))
                        {
                            Store (C1LM, Index (C3ST, 0x01))
                            Store (C3LM, Index (C3ST, 0x02))
                            Store (C7SM, Index (C3ST, 0x03))
                            Return (C3ST)
                        }
                        Else
                        {
                            Store (C1LM, Index (C2ST, 0x01))
                            Store (C7SM, Index (C2ST, 0x02))
                            Return (C2ST)
                        }
                    }

                    If (And (CFGD, 0x20))
                    {
                        If (And (CFGD, 0x08))
                        {
                            Store (C1LM, Index (C3ST, 0x01))
                            Store (C3LM, Index (C3ST, 0x02))
                            Store (C7LM, Index (C3ST, 0x03))
                            Return (C3ST)
                        }
                        Else
                        {
                            Store (C1LM, Index (C2ST, 0x01))
                            Store (C7LM, Index (C2ST, 0x02))
                            Return (C2ST)
                        }
                    }

                    If (And (CFGD, 0x10))
                    {
                        If (And (CFGD, 0x08))
                        {
                            Store (C1LM, Index (C3ST, 0x01))
                            Store (C3LM, Index (C3ST, 0x02))
                            Store (C6LM, Index (C3ST, 0x03))
                            Return (C3ST)
                        }
                        Else
                        {
                            Store (C1LM, Index (C2ST, 0x01))
                            Store (C6LM, Index (C2ST, 0x02))
                            Return (C2ST)
                        }
                    }

                    If (And (CFGD, 0x08))
                    {
                        Store (C1LM, Index (C2ST, 0x01))
                        Store (C3LM, Index (C2ST, 0x02))
                        Return (C2ST)
                    }
                    Else
                    {
                        Store (C1LM, Index (C1ST, 0x01))
                        Return (C1ST)
                    }
                }

                If (And (CFGD, 0x10))
                {
                    Store (C1LM, Index (C2ST, 0x01))
                    Store (C6LM, Index (C2ST, 0x02))
                    Return (C2ST)
                }
                Else
                {
                    Store (C1LM, Index (C1ST, 0x01))
                    Return (C1ST)
                }
            }

            If (LAnd (And (CFGD, 0x1000), And (PDC0, 0x0100)))
            {
                If (LOr (LNot (PWRS), LNotEqual (PFLV, FMBL)))
                {
                    If (And (CFGD, 0x20))
                    {
                        If (And (CFGD, 0x08))
                        {
                            Store (C1LM, Index (C3ST, 0x01))
                            Store (C3LI, Index (C3ST, 0x02))
                            Store (C7LI, Index (C3ST, 0x03))
                            Return (C3ST)
                        }
                        Else
                        {
                            Store (C1LM, Index (C2ST, 0x01))
                            Store (C7LI, Index (C2ST, 0x02))
                            Return (C2ST)
                        }
                    }

                    If (And (CFGD, 0x10))
                    {
                        If (And (CFGD, 0x08))
                        {
                            Store (C1LM, Index (C3ST, 0x01))
                            Store (C3LI, Index (C3ST, 0x02))
                            Store (C6LI, Index (C3ST, 0x03))
                            Return (C3ST)
                        }
                        Else
                        {
                            Store (C1LM, Index (C2ST, 0x01))
                            Store (C6LI, Index (C2ST, 0x02))
                            Return (C2ST)
                        }
                    }

                    If (And (CFGD, 0x08))
                    {
                        Store (C1LM, Index (C2ST, 0x01))
                        Store (C3LI, Index (C2ST, 0x02))
                        Return (C2ST)
                    }
                    Else
                    {
                        Store (C1LM, Index (C1ST, 0x01))
                        Return (C1ST)
                    }
                }

                If (And (CFGD, 0x10))
                {
                    Store (C1LM, Index (C2ST, 0x01))
                    Store (C6LI, Index (C2ST, 0x02))
                    Return (C2ST)
                }
                Else
                {
                    Store (C1LM, Index (C1ST, 0x01))
                    Return (C1ST)
                }
            }

            If (LOr (LNot (PWRS), LNotEqual (PFLV, FMBL)))
            {
                If (And (CFGD, 0x20))
                {
                    If (And (CFGD, 0x08))
                    {
                        Store (C1LH, Index (C3ST, 0x01))
                        Store (C3LI, Index (C3ST, 0x02))
                        Store (C7LI, Index (C3ST, 0x03))
                        Return (C3ST)
                    }
                    Else
                    {
                        Store (C1LH, Index (C2ST, 0x01))
                        Store (C7LI, Index (C2ST, 0x02))
                        Return (C2ST)
                    }
                }

                If (And (CFGD, 0x10))
                {
                    If (And (CFGD, 0x08))
                    {
                        Store (C1LH, Index (C3ST, 0x01))
                        Store (C3LI, Index (C3ST, 0x02))
                        Store (C6LI, Index (C3ST, 0x03))
                        Return (C3ST)
                    }
                    Else
                    {
                        Store (C1LH, Index (C2ST, 0x01))
                        Store (C6LI, Index (C2ST, 0x02))
                        Return (C2ST)
                    }
                }

                If (And (CFGD, 0x08))
                {
                    Store (C1LH, Index (C2ST, 0x01))
                    Store (C3LI, Index (C2ST, 0x02))
                    Return (C2ST)
                }
                Else
                {
                    Store (C1LH, Index (C1ST, 0x01))
                    Return (C1ST)
                }
            }

            If (And (CFGD, 0x10))
            {
                Store (C1LH, Index (C2ST, 0x01))
                Store (C6LI, Index (C2ST, 0x02))
                Return (C2ST)
            }
            Else
            {
                Store (C1LH, Index (C1ST, 0x01))
                Return (C1ST)
            }
        }
    }
}

