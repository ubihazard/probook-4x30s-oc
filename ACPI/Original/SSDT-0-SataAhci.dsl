/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of Dump/SSDT-0-SataAhci.aml, Sun Oct 12 00:26:50 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000266 (614)
 *     Revision         0x01
 *     Checksum         0xA5
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "SataAhci"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20060912 (537266450)
 */
DefinitionBlock ("", "SSDT", 1, "HPQOEM", "SataAhci", 0x00001000)
{
    External (_SB_.PCI0.SATA, DeviceObj)
    External (GIV_, FieldUnitObj)
    External (GPIE, FieldUnitObj)
    External (GPIS, FieldUnitObj)
    External (GPL0, FieldUnitObj)
    External (GPL3, FieldUnitObj)
    External (GPSL, FieldUnitObj)

    Scope (\_SB.PCI0.SATA)
    {
        Device (PRT0)
        {
            Name (_ADR, 0xFFFF)  // _ADR: Address
            Name (GTH0, Buffer (0x07)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
            })
            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Store (Buffer (0x07)
                    {
                         0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
                    }, GTH0)
                Return (GTH0)
            }
        }

        Device (PRT1)
        {
            Name (_ADR, 0x0001FFFF)  // _ADR: Address
            Name (GTH1, Buffer (0x07)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
            })
            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Store (Buffer (0x07)
                    {
                         0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
                    }, GTH1)
                Return (GTH1)
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                Return (HDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Device (PRT2)
        {
            Name (_ADR, 0x0002FFFF)  // _ADR: Address
            Name (GTH2, Buffer (0x07)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
            })
            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Store (Buffer (0x07)
                    {
                         0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
                    }, GTH2)
                Return (GTH2)
            }
        }

        Device (PRT3)
        {
            Name (_ADR, 0x0003FFFF)  // _ADR: Address
            Name (GTF3, Buffer (0x07)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
            })
            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Store (Buffer (0x07)
                    {
                         0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
                    }, GTF3)
                Return (GTF3)
            }
        }

        Device (PRT5)
        {
            Name (_ADR, 0x0005FFFF)  // _ADR: Address
            Name (GTF5, Buffer (0x07)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
            })
            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Store (Buffer (0x07)
                    {
                         0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00       
                    }, GTF5)
                Return (GTF5)
            }
        }
    }

    Method (HDSM, 4, Serialized)
    {
        If (LEqual (Arg0, ToUUID ("bdfaef30-aebb-11de-8a39-0800200c9a66")))
        {
            If (LEqual (ToInteger (Arg2), 0x00))
            {
                If (LEqual (ToInteger (Arg1), 0x01))
                {
                    Return (Buffer (0x01)
                    {
                         0x0F                                           
                    })
                }
                Else
                {
                    Return (Buffer (0x01)
                    {
                         0x00                                           
                    })
                }
            }
            ElseIf (LEqual (ToInteger (Arg2), 0x01))
            {
                Return (0x01)
            }
            ElseIf (LEqual (ToInteger (Arg2), 0x02))
            {
                And (GPSL, Not (0x08), Local0)
                Store (Local0, GPSL)
                And (GPL0, 0x08, Local1)
                If (LEqual (Local1, 0x08))
                {
                    Or (GIV, 0x08, GIV)
                }
                Else
                {
                    And (GIV, Not (0x08), GIV)
                }

                And (GPL3, Not (0x10), Local0)
                Store (Local0, GPL3)
                Sleep (0xC8)
                Or (GPSL, 0x08, GPSL)
                Return (0x01)
            }
            ElseIf (LEqual (ToInteger (Arg2), 0x03))
            {
                And (GPIE, Not (0x08), GPIE)
                Or (GPIS, 0x08, GPIS)
                Or (GPL3, 0x10, Local0)
                Store (Local0, GPL3)
                Return (0x01)
            }
            Else
            {
                Return (0x00)
            }
        }
        Else
        {
            Return (0x00)
        }
    }
}

