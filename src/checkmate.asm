; Original checkmate Intel 8080 ROM, source reconstructed from original bytes.
; Native instruction mnemonics are executable; uncertain regions retain DB.
; Original byte offsets are preserved; zmac v1.3 must rebuild exactly.

        ORG $0000
; Device checkmat.h, SHA1 f758599d6393398a6a8e6e7399dc1a3862604f65
NATIVE_0000:
        NOP  ; ROM $0000: 00
        NOP  ; ROM $0001: 00
        XOR A  ; ROM $0002: AF
        OUT ($01),A  ; ROM $0003: D3 01
        JP $0097  ; ROM $0005: C3 97 00
NATIVE_0008:
        PUSH AF  ; ROM $0008: F5
        PUSH BC  ; ROM $0009: C5
        PUSH DE  ; ROM $000A: D5
        LD B,$00  ; ROM $000B: 06 00
        JP $002B  ; ROM $000D: C3 2B 00
NATIVE_0010:
        PUSH AF  ; ROM $0010: F5
        PUSH BC  ; ROM $0011: C5
        PUSH DE  ; ROM $0012: D5
        LD B,$01  ; ROM $0013: 06 01
        JP $002B  ; ROM $0015: C3 2B 00
NATIVE_0018:
        JP $0D7D  ; ROM $0018: C3 7D 0D
        DB $08,$4D,$41,$54,$C5 ; ROM $001B unclassified
NATIVE_0020:
        JP $0CA8  ; ROM $0020: C3 A8 0C
        DB $08,$43,$4F,$49,$CE ; ROM $0023 unclassified
NATIVE_0028:
        JP $0C99  ; ROM $0028: C3 99 0C
NATIVE_002B:
        PUSH HL  ; ROM $002B: E5
        CALL $007F  ; ROM $002C: CD 7F 00
        LD A,B  ; ROM $002F: 78
        RRCA  ; ROM $0030: 0F
        JP NC,$0079  ; ROM $0031: D2 79 00
        LD HL,$2003  ; ROM $0034: 21 03 20
        CALL $0092  ; ROM $0037: CD 92 00
        LD HL,$21BE  ; ROM $003A: 21 BE 21
        CALL $0092  ; ROM $003D: CD 92 00
        INC HL  ; ROM $0040: 23
        CALL $0092  ; ROM $0041: CD 92 00
        IN A,($00)  ; ROM $0044: DB 00
        AND $0F  ; ROM $0046: E6 0F
        JP Z,$0053  ; ROM $0048: CA 53 00
        LD ($21C2),A  ; ROM $004B: 32 C2 21
        LD A,$01  ; ROM $004E: 3E 01
        LD ($21C1),A  ; ROM $0050: 32 C1 21
NATIVE_0053:
        IN A,($00)  ; ROM $0053: DB 00
        RRCA  ; ROM $0055: 0F
        RRCA  ; ROM $0056: 0F
        RRCA  ; ROM $0057: 0F
        RRCA  ; ROM $0058: 0F
        AND $0F  ; ROM $0059: E6 0F
        JP Z,$0061  ; ROM $005B: CA 61 00
        LD ($21CA),A  ; ROM $005E: 32 CA 21
NATIVE_0061:
        IN A,($01)  ; ROM $0061: DB 01
        AND $0F  ; ROM $0063: E6 0F
        JP Z,$006B  ; ROM $0065: CA 6B 00
        LD ($21D2),A  ; ROM $0068: 32 D2 21
NATIVE_006B:
        IN A,($01)  ; ROM $006B: DB 01
        RRCA  ; ROM $006D: 0F
        RRCA  ; ROM $006E: 0F
        RRCA  ; ROM $006F: 0F
        RRCA  ; ROM $0070: 0F
        AND $0F  ; ROM $0071: E6 0F
        JP Z,$0079  ; ROM $0073: CA 79 00
        LD ($21DA),A  ; ROM $0076: 32 DA 21
NATIVE_0079:
        POP HL  ; ROM $0079: E1
        POP DE  ; ROM $007A: D1
        POP BC  ; ROM $007B: C1
        POP AF  ; ROM $007C: F1
        EI  ; ROM $007D: FB
        RET  ; ROM $007E: C9
NATIVE_007F:
        IN A,($03)  ; ROM $007F: DB 03
        LD C,A  ; ROM $0081: 4F
        IN A,($03)  ; ROM $0082: DB 03
        CP C  ; ROM $0084: B9
        RET NZ  ; ROM $0085: C0
        LD HL,$2000  ; ROM $0086: 21 00 20
        XOR (HL)  ; ROM $0089: AE
        LD (HL),C  ; ROM $008A: 71
        AND C  ; ROM $008B: A1
        AND $80  ; ROM $008C: E6 80
        RET Z  ; ROM $008E: C8
        INC HL  ; ROM $008F: 23
        LD (HL),A  ; ROM $0090: 77
        RET  ; ROM $0091: C9
NATIVE_0092:
        LD A,(HL)  ; ROM $0092: 7E
        AND A  ; ROM $0093: A7
        RET Z  ; ROM $0094: C8
        DEC (HL)  ; ROM $0095: 35
        RET  ; ROM $0096: C9
NATIVE_0097:
        IN A,($02)  ; ROM $0097: DB 02
        AND $80  ; ROM $0099: E6 80
        JP Z,$04F9  ; ROM $009B: CA F9 04
        LD B,$01  ; ROM $009E: 06 01
        LD DE,$0000  ; ROM $00A0: 11 00 00
NATIVE_00A3:
        LD HL,$2000  ; ROM $00A3: 21 00 20
NATIVE_00A6:
        OUT ($02),A  ; ROM $00A6: D3 02
        LD (HL),B  ; ROM $00A8: 70
        LD A,(HL)  ; ROM $00A9: 7E
        XOR B  ; ROM $00AA: A8
        JP Z,$00BD  ; ROM $00AB: CA BD 00
        LD C,A  ; ROM $00AE: 4F
        LD A,L  ; ROM $00AF: 7D
        AND $01  ; ROM $00B0: E6 01
        LD A,C  ; ROM $00B2: 79
        JP NZ,$00BB  ; ROM $00B3: C2 BB 00
        OR D  ; ROM $00B6: B2
        LD D,A  ; ROM $00B7: 57
        JP $00BD  ; ROM $00B8: C3 BD 00
NATIVE_00BB:
        OR E  ; ROM $00BB: B3
        LD E,A  ; ROM $00BC: 5F
NATIVE_00BD:
        INC HL  ; ROM $00BD: 23
        LD A,H  ; ROM $00BE: 7C
        CP $40  ; ROM $00BF: FE 40
        JP NZ,$00A6  ; ROM $00C1: C2 A6 00
NATIVE_00C4:
        OUT ($02),A  ; ROM $00C4: D3 02
        DEC HL  ; ROM $00C6: 2B
        LD A,H  ; ROM $00C7: 7C
        CP $1F  ; ROM $00C8: FE 1F
        JP Z,$00FA  ; ROM $00CA: CA FA 00
        LD A,(HL)  ; ROM $00CD: 7E
        XOR B  ; ROM $00CE: A8
        JP Z,$00E1  ; ROM $00CF: CA E1 00
        LD C,A  ; ROM $00D2: 4F
        LD A,L  ; ROM $00D3: 7D
        AND $01  ; ROM $00D4: E6 01
        LD A,C  ; ROM $00D6: 79
        JP NZ,$00DF  ; ROM $00D7: C2 DF 00
        OR D  ; ROM $00DA: B2
        LD D,A  ; ROM $00DB: 57
        JP $00E1  ; ROM $00DC: C3 E1 00
NATIVE_00DF:
        OR E  ; ROM $00DF: B3
        LD E,A  ; ROM $00E0: 5F
NATIVE_00E1:
        LD A,B  ; ROM $00E1: 78
        CPL  ; ROM $00E2: 2F
        LD (HL),A  ; ROM $00E3: 77
        XOR (HL)  ; ROM $00E4: AE
        JP Z,$00C4  ; ROM $00E5: CA C4 00
        LD C,A  ; ROM $00E8: 4F
        LD A,L  ; ROM $00E9: 7D
        AND $01  ; ROM $00EA: E6 01
        LD A,C  ; ROM $00EC: 79
        JP NZ,$00F5  ; ROM $00ED: C2 F5 00
        OR D  ; ROM $00F0: B2
        LD D,A  ; ROM $00F1: 57
        JP $00F7  ; ROM $00F2: C3 F7 00
NATIVE_00F5:
        OR E  ; ROM $00F5: B3
        LD E,A  ; ROM $00F6: 5F
NATIVE_00F7:
        JP $00C4  ; ROM $00F7: C3 C4 00
NATIVE_00FA:
        OUT ($02),A  ; ROM $00FA: D3 02
        INC HL  ; ROM $00FC: 23
        LD A,H  ; ROM $00FD: 7C
        CP $40  ; ROM $00FE: FE 40
        JP Z,$011D  ; ROM $0100: CA 1D 01
        LD A,B  ; ROM $0103: 78
        CPL  ; ROM $0104: 2F
        XOR (HL)  ; ROM $0105: AE
        JP Z,$0118  ; ROM $0106: CA 18 01
        LD C,A  ; ROM $0109: 4F
        LD A,L  ; ROM $010A: 7D
        AND $01  ; ROM $010B: E6 01
        LD A,C  ; ROM $010D: 79
        JP NZ,$0116  ; ROM $010E: C2 16 01
        OR D  ; ROM $0111: B2
        LD D,A  ; ROM $0112: 57
        JP $0118  ; ROM $0113: C3 18 01
NATIVE_0116:
        OR E  ; ROM $0116: B3
        LD E,A  ; ROM $0117: 5F
NATIVE_0118:
        XOR A  ; ROM $0118: AF
        LD (HL),A  ; ROM $0119: 77
        JP $00FA  ; ROM $011A: C3 FA 00
NATIVE_011D:
        LD A,B  ; ROM $011D: 78
        RLCA  ; ROM $011E: 07
        LD B,A  ; ROM $011F: 47
        JP NC,$00A3  ; ROM $0120: D2 A3 00
        LD A,D  ; ROM $0123: 7A
        OR E  ; ROM $0124: B3
        JP Z,$014C  ; ROM $0125: CA 4C 01
        EX DE,HL  ; ROM $0128: EB
        LD SP,HL  ; ROM $0129: F9
        LD DE,$2000  ; ROM $012A: 11 00 20
        LD B,$00  ; ROM $012D: 06 00
NATIVE_012F:
        LD HL,$0000  ; ROM $012F: 21 00 00
        ADD HL,SP  ; ROM $0132: 39
        LD C,$10  ; ROM $0133: 0E 10
NATIVE_0135:
        XOR A  ; ROM $0135: AF
        ADD HL,HL  ; ROM $0136: 29
        JP C,$013B  ; ROM $0137: DA 3B 01
        CPL  ; ROM $013A: 2F
NATIVE_013B:
        LD (DE),A  ; ROM $013B: 12
        INC DE  ; ROM $013C: 13
        LD A,$18  ; ROM $013D: 3E 18
        LD (DE),A  ; ROM $013F: 12
        INC DE  ; ROM $0140: 13
        DEC C  ; ROM $0141: 0D
        JP NZ,$0135  ; ROM $0142: C2 35 01
        DEC B  ; ROM $0145: 05
        JP NZ,$012F  ; ROM $0146: C2 2F 01
        JP $0185  ; ROM $0149: C3 85 01
NATIVE_014C:
        LD SP,$2400  ; ROM $014C: 31 00 24
        LD HL,$280C  ; ROM $014F: 21 0C 28
        PUSH HL  ; ROM $0152: E5
        LD HL,$0000  ; ROM $0153: 21 00 00
        LD DE,$0193  ; ROM $0156: 11 93 01
NATIVE_0159:
        LD BC,$0400  ; ROM $0159: 01 00 04
        XOR A  ; ROM $015C: AF
NATIVE_015D:
        ADD A,(HL)  ; ROM $015D: 86
        OUT ($02),A  ; ROM $015E: D3 02
        INC HL  ; ROM $0160: 23
        DEC C  ; ROM $0161: 0D
        JP NZ,$015D  ; ROM $0162: C2 5D 01
        DEC B  ; ROM $0165: 05
        JP NZ,$015D  ; ROM $0166: C2 5D 01
        INC A  ; ROM $0169: 3C
        JP Z,$0177  ; ROM $016A: CA 77 01
        LD A,(DE)  ; ROM $016D: 1A
        EX (SP),HL  ; ROM $016E: E3
        EX DE,HL  ; ROM $016F: EB
        PUSH BC  ; ROM $0170: C5
        CALL $0400  ; ROM $0171: CD 00 04
        POP BC  ; ROM $0174: C1
        EX DE,HL  ; ROM $0175: EB
        EX (SP),HL  ; ROM $0176: E3
NATIVE_0177:
        INC DE  ; ROM $0177: 13
        LD A,H  ; ROM $0178: 7C
        CP $10  ; ROM $0179: FE 10
        JP NZ,$0159  ; ROM $017B: C2 59 01
        POP HL  ; ROM $017E: E1
        LD A,L  ; ROM $017F: 7D
        CP $0C  ; ROM $0180: FE 0C
        JP Z,$0000  ; ROM $0182: CA 00 00
NATIVE_0185:
        OUT ($02),A  ; ROM $0185: D3 02
        JP $0185  ; ROM $0187: C3 85 01
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$48,$47,$46 ; ROM $018A unclassified
        DB $45,$3C,$7E,$66,$66,$66,$66,$66,$66,$7E,$3C,$18 ; ROM $0196 unclassified
        DB $1C,$18,$18,$18,$18,$18,$18,$3C,$3C,$3C,$7E,$66 ; ROM $01A2 unclassified
        DB $60,$7C,$3E,$06,$06,$7E,$7E,$3C,$7E,$66,$60,$38 ; ROM $01AE unclassified
        DB $78,$60,$66,$7E,$3C,$66,$66,$66,$66,$7E,$7E,$60 ; ROM $01BA unclassified
        DB $60,$60,$60,$3E,$3E,$06,$06,$3E,$7E,$60,$66,$7E ; ROM $01C6 unclassified
        DB $3C,$3C,$3E,$06,$06,$3E,$7E,$66,$66,$7E,$3C,$7E ; ROM $01D2 unclassified
        DB $7E,$60,$70,$30,$38,$18,$1C,$0C,$0C,$3C,$7E,$66 ; ROM $01DE unclassified
        DB $66,$3C,$7E,$66,$66,$7E,$3C,$3C,$7E,$66,$66,$7E ; ROM $01EA unclassified
        DB $7C,$60,$60,$7C,$3C,$00,$FF,$81,$81,$81,$81,$81 ; ROM $01F6 unclassified
        DB $81,$FF,$00,$00,$FF,$81,$BD,$A5,$A5,$BD,$81,$FF ; ROM $0202 unclassified
        DB $00,$00,$FF,$D5,$AB,$D5,$AB,$D5,$AB,$FF,$00,$00 ; ROM $020E unclassified
        DB $FF,$E7,$E7,$99,$99,$E7,$E7,$FF,$00,$FF,$FF,$FF ; ROM $021A unclassified
        DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$18,$18,$18,$18,$18 ; ROM $0226 unclassified
        DB $18,$00,$00,$18,$18,$00,$00,$00,$00,$00,$00,$00 ; ROM $0232 unclassified
        DB $00,$00,$00,$18,$3C,$7E,$66,$66,$66,$7E,$7E,$66 ; ROM $023E unclassified
        DB $66,$3E,$7E,$66,$66,$3E,$7E,$66,$66,$7E,$3E,$3C ; ROM $024A unclassified
        DB $7E,$66,$06,$06,$06,$06,$66,$7E,$3C,$3E,$7E,$66 ; ROM $0256 unclassified
        DB $66,$66,$66,$66,$66,$7E,$3E,$7E,$7E,$06,$06,$3E ; ROM $0262 unclassified
        DB $3E,$06,$06,$7E,$7E,$7E,$7E,$06,$06,$3E,$3E,$06 ; ROM $026E unclassified
        DB $06,$06,$06,$3C,$7E,$66,$06,$06,$76,$76,$66,$7E ; ROM $027A unclassified
        DB $3C,$66,$66,$66,$66,$7E,$7E,$66,$66,$66,$66,$3C ; ROM $0286 unclassified
        DB $3C,$18,$18,$18,$18,$18,$18,$3C,$3C,$60,$60,$60 ; ROM $0292 unclassified
        DB $60,$60,$60,$60,$66,$7E,$3C,$66,$66,$76,$3E,$1E ; ROM $029E unclassified
        DB $1E,$3E,$76,$66,$66,$06,$06,$06,$06,$06,$06,$06 ; ROM $02AA unclassified
        DB $06,$7E,$7E,$C3,$C3,$E7,$E7,$FF,$FF,$DB,$C3,$C3 ; ROM $02B6 unclassified
        DB $C3,$66,$66,$6E,$6E,$7E,$7E,$76,$76,$66,$66,$3C ; ROM $02C2 unclassified
        DB $7E,$66,$66,$66,$66,$66,$66,$7E,$3C,$3E,$7E,$66 ; ROM $02CE unclassified
        DB $66,$7E,$3E,$06,$06,$06,$06,$3C,$7E,$66,$66,$66 ; ROM $02DA unclassified
        DB $66,$66,$66,$7E,$5C,$3E,$7E,$66,$66,$7E,$3E,$76 ; ROM $02E6 unclassified
        DB $66,$66,$66,$3C,$7E,$66,$06,$3E,$7C,$60,$66,$7E ; ROM $02F2 unclassified
        DB $3C,$7E,$7E,$18,$18,$18,$18,$18,$18,$18,$18,$66 ; ROM $02FE unclassified
        DB $66,$66,$66,$66,$66,$66,$66,$7E,$3C,$66,$66,$66 ; ROM $030A unclassified
        DB $66,$66,$7E,$3C,$3C,$18,$18,$C3,$C3,$C3,$DB,$FF ; ROM $0316 unclassified
        DB $FF,$E7,$E7,$C3,$C3,$66,$66,$7E,$3C,$18,$18,$3C ; ROM $0322 unclassified
        DB $7E,$66,$66,$66,$66,$7E,$3C,$18,$18,$18,$18,$18 ; ROM $032E unclassified
        DB $18,$7E,$7E,$60,$70,$38,$1C,$0E,$06,$7E,$7E,$00 ; ROM $033A unclassified
        DB $FF,$EF,$E7,$EF,$EF,$EF,$C7,$FF,$00,$00,$FF,$C3 ; ROM $0346 unclassified
        DB $DB,$DF,$C3,$FB,$C3,$FF,$00,$00,$FF,$C3,$DF,$E7 ; ROM $0352 unclassified
        DB $DF,$DF,$C3,$FF,$00,$00,$FF,$DB,$DB,$C3,$DF,$DF ; ROM $035E unclassified
        DB $DF,$FF,$00,$FF,$FF,$FF,$E8,$EA,$E8,$EE,$8E,$FF ; ROM $036A unclassified
        DB $FF,$FF,$FF,$FF,$A8,$AA,$88,$DA,$DA,$FF,$FF,$FF ; ROM $0376 unclassified
        DB $FF,$FF,$C8,$AE,$CC,$AE,$A8,$FF,$FF,$FF,$FF,$FF ; ROM $0382 unclassified
        DB $47,$57,$57,$57,$47,$FF,$FF,$FF,$FF,$FF,$17,$D6 ; ROM $038E unclassified
        DB $95,$D3,$17,$FF,$FF,$FF,$FF,$FF,$47,$6F,$6F,$6F ; ROM $039A unclassified
        DB $EF,$FF,$FF,$FF,$FF,$FF,$17,$57,$55,$55,$18,$FF ; ROM $03A6 unclassified
        DB $FF,$FF,$FF,$FF,$1F,$BF,$BF,$BF,$BF,$FF,$FF,$FF ; ROM $03B2 unclassified
        DB $FF,$FF,$95,$55,$91,$55,$55,$FF,$FF,$FF,$FF,$FF ; ROM $03BE unclassified
        DB $11,$DD,$99,$DD,$11,$FF,$FF,$FF,$FF,$FF,$11,$5D ; ROM $03CA unclassified
        DB $59,$5D,$1D,$FF,$FF,$FF,$FF,$FF,$95,$55,$95,$55 ; ROM $03D6 unclassified
        DB $51,$FF,$FF ; ROM $03E2 unclassified
NATIVE_03E5:
        LD A,(HL)  ; ROM $03E5: 7E
        AND $F0  ; ROM $03E6: E6 F0
        JP NZ,$03F4  ; ROM $03E8: C2 F4 03
        LD A,$40  ; ROM $03EB: 3E 40
        CALL $0400  ; ROM $03ED: CD 00 04
        JP $03FB  ; ROM $03F0: C3 FB 03
        DB $7E ; ROM $03F3 unclassified
NATIVE_03F4:
        RLCA  ; ROM $03F4: 07
        RLCA  ; ROM $03F5: 07
        RLCA  ; ROM $03F6: 07
        RLCA  ; ROM $03F7: 07
        CALL $03FC  ; ROM $03F8: CD FC 03
NATIVE_03FB:
        LD A,(HL)  ; ROM $03FB: 7E
NATIVE_03FC:
        AND $0F  ; ROM $03FC: E6 0F
        ADD A,$30  ; ROM $03FE: C6 30

        ORG $0400
; Device checkmat.g, SHA1 484ff9bfb95166ba09f34c753a7908a73de3cc7d
NATIVE_0400:
        AND $7F  ; ROM $0400: E6 7F
        CP $30  ; ROM $0402: FE 30
        LD B,$00  ; ROM $0404: 06 00
        JP NC,$041D  ; ROM $0406: D2 1D 04
        EX DE,HL  ; ROM $0409: EB
        LD BC,$01E0  ; ROM $040A: 01 E0 01
NATIVE_040D:
        PUSH AF  ; ROM $040D: F5
        INC HL  ; ROM $040E: 23
        LD A,L  ; ROM $040F: 7D
        AND $1F  ; ROM $0410: E6 1F
        JP NZ,$0416  ; ROM $0412: C2 16 04
        ADD HL,BC  ; ROM $0415: 09
NATIVE_0416:
        POP AF  ; ROM $0416: F1
        DEC A  ; ROM $0417: 3D
        JP NZ,$040D  ; ROM $0418: C2 0D 04
        EX DE,HL  ; ROM $041B: EB
        RET  ; ROM $041C: C9
NATIVE_041D:
        PUSH HL  ; ROM $041D: E5
        PUSH DE  ; ROM $041E: D5
        CALL $043A  ; ROM $041F: CD 3A 04
        LD A,($21E8)  ; ROM $0422: 3A E8 21
        LD C,A  ; ROM $0425: 4F
NATIVE_0426:
        PUSH BC  ; ROM $0426: C5
        LD A,(DE)  ; ROM $0427: 1A
        INC DE  ; ROM $0428: 13
        XOR C  ; ROM $0429: A9
        LD (HL),A  ; ROM $042A: 77
        LD BC,$0020  ; ROM $042B: 01 20 00
        ADD HL,BC  ; ROM $042E: 09
        POP BC  ; ROM $042F: C1
        DEC B  ; ROM $0430: 05
        JP NZ,$0426  ; ROM $0431: C2 26 04
        POP DE  ; ROM $0434: D1
        INC DE  ; ROM $0435: 13
        POP HL  ; ROM $0436: E1
        RET  ; ROM $0437: C9
NATIVE_0438:
        LD B,$00  ; ROM $0438: 06 00
NATIVE_043A:
        SUB $30  ; ROM $043A: D6 30
        LD C,A  ; ROM $043C: 4F
        LD H,B  ; ROM $043D: 60
        LD L,C  ; ROM $043E: 69
        ADD HL,HL  ; ROM $043F: 29
        ADD HL,HL  ; ROM $0440: 29
        ADD HL,HL  ; ROM $0441: 29
        ADD HL,BC  ; ROM $0442: 09
        ADD HL,BC  ; ROM $0443: 09
        LD BC,$0197  ; ROM $0444: 01 97 01
        ADD HL,BC  ; ROM $0447: 09
        LD B,$0A  ; ROM $0448: 06 0A
        EX DE,HL  ; ROM $044A: EB
        RET  ; ROM $044B: C9
NATIVE_044C:
        AND $7F  ; ROM $044C: E6 7F
        PUSH HL  ; ROM $044E: E5
        CP $30  ; ROM $044F: FE 30
        JP NC,$045B  ; ROM $0451: D2 5B 04
        LD L,A  ; ROM $0454: 6F
        LD H,$00  ; ROM $0455: 26 00
        ADD HL,DE  ; ROM $0457: 19
        EX DE,HL  ; ROM $0458: EB
        POP HL  ; ROM $0459: E1
        RET  ; ROM $045A: C9
NATIVE_045B:
        PUSH DE  ; ROM $045B: D5
        CALL $0438  ; ROM $045C: CD 38 04
NATIVE_045F:
        PUSH BC  ; ROM $045F: C5
        LD A,(DE)  ; ROM $0460: 1A
        INC DE  ; ROM $0461: 13
        PUSH DE  ; ROM $0462: D5
        PUSH HL  ; ROM $0463: E5
        LD HL,$21E3  ; ROM $0464: 21 E3 21
        LD BC,$0004  ; ROM $0467: 01 04 00
NATIVE_046A:
        LD E,A  ; ROM $046A: 5F
        LD D,B  ; ROM $046B: 50
        RLCA  ; ROM $046C: 07
        JP NC,$0472  ; ROM $046D: D2 72 04
        LD D,$F0  ; ROM $0470: 16 F0
NATIVE_0472:
        RLCA  ; ROM $0472: 07
        LD A,B  ; ROM $0473: 78
        JP NC,$0479  ; ROM $0474: D2 79 04
        LD A,$0F  ; ROM $0477: 3E 0F
NATIVE_0479:
        OR D  ; ROM $0479: B2
        LD (HL),A  ; ROM $047A: 77
        DEC HL  ; ROM $047B: 2B
        LD A,E  ; ROM $047C: 7B
        RLCA  ; ROM $047D: 07
        RLCA  ; ROM $047E: 07
        DEC C  ; ROM $047F: 0D
        JP NZ,$046A  ; ROM $0480: C2 6A 04
        EX DE,HL  ; ROM $0483: EB
        INC DE  ; ROM $0484: 13
        POP HL  ; ROM $0485: E1
        LD C,$04  ; ROM $0486: 0E 04
NATIVE_0488:
        PUSH DE  ; ROM $0488: D5
        PUSH HL  ; ROM $0489: E5
        LD B,$04  ; ROM $048A: 06 04
NATIVE_048C:
        LD A,(DE)  ; ROM $048C: 1A
        INC DE  ; ROM $048D: 13
        LD (HL),A  ; ROM $048E: 77
        INC HL  ; ROM $048F: 23
        DEC B  ; ROM $0490: 05
        JP NZ,$048C  ; ROM $0491: C2 8C 04
        POP HL  ; ROM $0494: E1
        LD DE,$0020  ; ROM $0495: 11 20 00
        ADD HL,DE  ; ROM $0498: 19
        POP DE  ; ROM $0499: D1
        DEC C  ; ROM $049A: 0D
        JP NZ,$0488  ; ROM $049B: C2 88 04
        POP DE  ; ROM $049E: D1
        POP BC  ; ROM $049F: C1
        DEC B  ; ROM $04A0: 05
        JP NZ,$045F  ; ROM $04A1: C2 5F 04
        POP DE  ; ROM $04A4: D1
        INC DE  ; ROM $04A5: 13
        INC DE  ; ROM $04A6: 13
        INC DE  ; ROM $04A7: 13
        INC DE  ; ROM $04A8: 13
        POP HL  ; ROM $04A9: E1
        RET  ; ROM $04AA: C9
        DB $A3,$00,$00,$00,$00,$00,$00,$00,$00,$18,$3C,$7E ; ROM $04AB unclassified
        DB $FF,$18,$18,$18,$18,$18,$18,$18,$18,$FF,$7E,$3C ; ROM $04B7 unclassified
        DB $18,$08,$0C,$0E,$FF,$FF,$0E,$0C,$08,$10,$30,$70 ; ROM $04C3 unclassified
        DB $FF,$FF,$70,$30,$10,$0A,$00,$00,$00,$18,$18,$00 ; ROM $04CF unclassified
        DB $00,$00,$0A,$00,$00,$24,$18,$18,$24,$00,$00,$0A ; ROM $04DB unclassified
        DB $00,$24,$42,$18,$18,$42,$24,$00,$14,$52,$81,$24 ; ROM $04E7 unclassified
        DB $11,$88,$24,$81,$4A,$00 ; ROM $04F3 unclassified
NATIVE_04F9:
        LD SP,$2400  ; ROM $04F9: 31 00 24
        CALL $0D0B  ; ROM $04FC: CD 0B 0D
        LD HL,$2000  ; ROM $04FF: 21 00 20
        LD BC,$047E  ; ROM $0502: 01 7E 04
        CALL $0514  ; ROM $0505: CD 14 05
        LD HL,$FFFF  ; ROM $0508: 21 FF FF
        LD ($200A),HL  ; ROM $050B: 22 0A 20
        LD ($200C),HL  ; ROM $050E: 22 0C 20
        JP $0672  ; ROM $0511: C3 72 06
NATIVE_0514:
        XOR A  ; ROM $0514: AF
NATIVE_0515:
        LD (HL),A  ; ROM $0515: 77
        INC HL  ; ROM $0516: 23
        DEC C  ; ROM $0517: 0D
        JP NZ,$0515  ; ROM $0518: C2 15 05
        DEC B  ; ROM $051B: 05
        JP NZ,$0515  ; ROM $051C: C2 15 05
        RET  ; ROM $051F: C9
NATIVE_0520:
        OUT ($02),A  ; ROM $0520: D3 02
        LD HL,$2001  ; ROM $0522: 21 01 20
        LD A,(HL)  ; ROM $0525: 7E
        AND A  ; ROM $0526: A7
        JP Z,$054E  ; ROM $0527: CA 4E 05
        LD (HL),$00  ; ROM $052A: 36 00
        INC HL  ; ROM $052C: 23
        INC (HL)  ; ROM $052D: 34
        LD DE,$0FE8  ; ROM $052E: 11 E8 0F
        CALL $0D78  ; ROM $0531: CD 78 0D
        LD A,($2006)  ; ROM $0534: 3A 06 20
        AND A  ; ROM $0537: A7
        RET NZ  ; ROM $0538: C0
        LD SP,$2400  ; ROM $0539: 31 00 24
        CALL $0D0B  ; ROM $053C: CD 0B 0D
        LD DE,$0000  ; ROM $053F: 11 00 00
NATIVE_0542:
        CALL $0DC6  ; ROM $0542: CD C6 0D
        CALL $06A5  ; ROM $0545: CD A5 06
NATIVE_0548:
        CALL $0520  ; ROM $0548: CD 20 05
        JP $0548  ; ROM $054B: C3 48 05
NATIVE_054E:
        LD A,($2003)  ; ROM $054E: 3A 03 20
        AND A  ; ROM $0551: A7
        JP NZ,$056E  ; ROM $0552: C2 6E 05
        LD HL,($2004)  ; ROM $0555: 2A 04 20
        LD A,(HL)  ; ROM $0558: 7E
        AND A  ; ROM $0559: A7
        JP Z,$056B  ; ROM $055A: CA 6B 05
        LD ($2003),A  ; ROM $055D: 32 03 20
        INC HL  ; ROM $0560: 23
        LD A,(HL)  ; ROM $0561: 7E
        OUT ($01),A  ; ROM $0562: D3 01
        INC HL  ; ROM $0564: 23
        LD ($2004),HL  ; ROM $0565: 22 04 20
        JP $056E  ; ROM $0568: C3 6E 05
NATIVE_056B:
        XOR A  ; ROM $056B: AF
        OUT ($01),A  ; ROM $056C: D3 01
NATIVE_056E:
        CALL $0D91  ; ROM $056E: CD 91 0D
        LD A,($2006)  ; ROM $0571: 3A 06 20
        AND A  ; ROM $0574: A7
        RET NZ  ; ROM $0575: C0
        IN A,($03)  ; ROM $0576: DB 03
        AND $0F  ; ROM $0578: E6 0F
        RET Z  ; ROM $057A: C8
        LD E,$00  ; ROM $057B: 1E 00
NATIVE_057D:
        INC E  ; ROM $057D: 1C
        RRCA  ; ROM $057E: 0F
        JP NC,$057D  ; ROM $057F: D2 7D 05
        IN A,($02)  ; ROM $0582: DB 02
        AND $01  ; ROM $0584: E6 01
        LD D,A  ; ROM $0586: 57
        LD A,E  ; ROM $0587: 7B
        RLCA  ; ROM $0588: 07
        OR D  ; ROM $0589: B2
        LD HL,$0E10  ; ROM $058A: 21 10 0E
        CALL $0C91  ; ROM $058D: CD 91 0C
        LD D,A  ; ROM $0590: 57
        LD HL,$2002  ; ROM $0591: 21 02 20
        LD A,(HL)  ; ROM $0594: 7E
        SUB D  ; ROM $0595: 92
        RET M  ; ROM $0596: F8
        LD (HL),A  ; ROM $0597: 77
        LD A,E  ; ROM $0598: 7B
        CP $01  ; ROM $0599: FE 01
        JP NZ,$05A7  ; ROM $059B: C2 A7 05
        LD ($2009),A  ; ROM $059E: 32 09 20
        LD A,$04  ; ROM $05A1: 3E 04
        LD E,A  ; ROM $05A3: 5F
        JP $05AA  ; ROM $05A4: C3 AA 05
NATIVE_05A7:
        LD ($2009),A  ; ROM $05A7: 32 09 20
NATIVE_05AA:
        LD ($2007),A  ; ROM $05AA: 32 07 20
        LD A,E  ; ROM $05AD: 7B
        LD HL,$0FB8  ; ROM $05AE: 21 B8 0F
        CALL $0C9C  ; ROM $05B1: CD 9C 0C
        LD ($200E),HL  ; ROM $05B4: 22 0E 20
        LD A,$01  ; ROM $05B7: 3E 01
        LD ($2006),A  ; ROM $05B9: 32 06 20
        LD SP,$2400  ; ROM $05BC: 31 00 24
        LD HL,$2027  ; ROM $05BF: 21 27 20
        LD BC,$0296  ; ROM $05C2: 01 96 02
        CALL $0514  ; ROM $05C5: CD 14 05
        IN A,($02)  ; ROM $05C8: DB 02
        RRCA  ; ROM $05CA: 0F
        RRCA  ; ROM $05CB: 0F
        AND $03  ; ROM $05CC: E6 03
        ADD A,$02  ; ROM $05CE: C6 02
        LD ($2008),A  ; ROM $05D0: 32 08 20
        LD A,$01  ; ROM $05D3: 3E 01
        LD ($2010),A  ; ROM $05D5: 32 10 20
        LD HL,$202D  ; ROM $05D8: 21 2D 20
        LD ($202B),HL  ; ROM $05DB: 22 2B 20
NATIVE_05DE:
        CALL $06BC  ; ROM $05DE: CD BC 06
        LD HL,$2010  ; ROM $05E1: 21 10 20
        RST $20  ; ROM $05E4: E7
        LD HL,$2008  ; ROM $05E5: 21 08 20
        DEC (HL)  ; ROM $05E8: 35
        JP NZ,$05DE  ; ROM $05E9: C2 DE 05
        XOR A  ; ROM $05EC: AF
        LD ($2006),A  ; ROM $05ED: 32 06 20
        LD HL,$2027  ; ROM $05F0: 21 27 20
        LD A,($2007)  ; ROM $05F3: 3A 07 20
        LD B,A  ; ROM $05F6: 47
        LD DE,$0000  ; ROM $05F7: 11 00 00
        LD C,D  ; ROM $05FA: 4A
NATIVE_05FB:
        LD A,(HL)  ; ROM $05FB: 7E
        INC HL  ; ROM $05FC: 23
        CP C  ; ROM $05FD: B9
        JP Z,$0608  ; ROM $05FE: CA 08 06
        JP C,$0609  ; ROM $0601: DA 09 06
        LD C,A  ; ROM $0604: 4F
        LD E,B  ; ROM $0605: 58
        LD D,$FF  ; ROM $0606: 16 FF
NATIVE_0608:
        INC D  ; ROM $0608: 14
NATIVE_0609:
        DEC B  ; ROM $0609: 05
        JP NZ,$05FB  ; ROM $060A: C2 FB 05
        LD A,D  ; ROM $060D: 7A
        AND A  ; ROM $060E: A7
        JP Z,$0621  ; ROM $060F: CA 21 06
        LD DE,$0104  ; ROM $0612: 11 04 01
        CALL $0DB8  ; ROM $0615: CD B8 0D
        LD DE,$0305  ; ROM $0618: 11 05 03
        CALL $0DB8  ; ROM $061B: CD B8 0D
        JP $0647  ; ROM $061E: C3 47 06
NATIVE_0621:
        LD HL,$0E3C  ; ROM $0621: 21 3C 0E
        CALL $0DE8  ; ROM $0624: CD E8 0D
        JP (HL)  ; ROM $0627: E9
        DB $D5,$11,$41,$2A,$21,$54,$0E,$CD,$BB,$0D,$13,$13 ; ROM $0628 unclassified
        DB $C1,$3A,$07,$20,$91,$C6,$31,$CD,$4C,$04,$11,$48 ; ROM $0634 unclassified
        DB $34,$21,$5A,$0E,$CD,$BB,$0D ; ROM $0640 unclassified
NATIVE_0647:
        LD A,$FF  ; ROM $0647: 3E FF
        RST $18  ; ROM $0649: DF
        CALL $069C  ; ROM $064A: CD 9C 06
        LD DE,$0106  ; ROM $064D: 11 06 01
        CALL $0DB8  ; ROM $0650: CD B8 0D
        LD DE,$0307  ; ROM $0653: 11 07 03
        CALL $0DB8  ; ROM $0656: CD B8 0D
        LD DE,$0FE5  ; ROM $0659: 11 E5 0F
        CALL $0D73  ; ROM $065C: CD 73 0D
        CALL $0DF2  ; ROM $065F: CD F2 0D
        LD A,($2002)  ; ROM $0662: 3A 02 20
        AND A  ; ROM $0665: A7
        JP Z,$0672  ; ROM $0666: CA 72 06
        CALL $0D0B  ; ROM $0669: CD 0B 0D
        LD DE,$0001  ; ROM $066C: 11 01 00
        JP $0542  ; ROM $066F: C3 42 05
NATIVE_0672:
        CALL $069C  ; ROM $0672: CD 9C 06
        LD DE,$0108  ; ROM $0675: 11 08 01
        CALL $0DB8  ; ROM $0678: CD B8 0D
        LD DE,$0309  ; ROM $067B: 11 09 03
        CALL $0DB8  ; ROM $067E: CD B8 0D
        LD A,$78  ; ROM $0681: 3E 78
        RST $18  ; ROM $0683: DF
        CALL $069C  ; ROM $0684: CD 9C 06
        LD DE,$010A  ; ROM $0687: 11 0A 01
        CALL $0DB8  ; ROM $068A: CD B8 0D
        LD DE,$030B  ; ROM $068D: 11 0B 03
        CALL $0DB8  ; ROM $0690: CD B8 0D
        LD A,$78  ; ROM $0693: 3E 78
        RST $18  ; ROM $0695: DF
        CALL $06D5  ; ROM $0696: CD D5 06
        JP $0672  ; ROM $0699: C3 72 06
NATIVE_069C:
        LD DE,$4000  ; ROM $069C: 11 00 40
        LD HL,$00C6  ; ROM $069F: 21 C6 00
        JP $0D11  ; ROM $06A2: C3 11 0D
NATIVE_06A5:
        LD DE,$0203  ; ROM $06A5: 11 03 02
        IN A,($02)  ; ROM $06A8: DB 02
        AND $01  ; ROM $06AA: E6 01
        JP NZ,$0DC6  ; ROM $06AC: C2 C6 0D
        LD A,($2002)  ; ROM $06AF: 3A 02 20
        CP $02  ; ROM $06B2: FE 02
        JP NC,$0DC6  ; ROM $06B4: D2 C6 0D
        LD E,$02  ; ROM $06B7: 1E 02
        JP $0DC6  ; ROM $06B9: C3 C6 0D
NATIVE_06BC:
        CALL $07F6  ; ROM $06BC: CD F6 07
        LD (HL),$FF  ; ROM $06BF: 36 FF
        CALL $07F6  ; ROM $06C1: CD F6 07
        LD (HL),$AA  ; ROM $06C4: 36 AA
        CALL $07F6  ; ROM $06C6: CD F6 07
        LD (HL),$FF  ; ROM $06C9: 36 FF
        CALL $07F6  ; ROM $06CB: CD F6 07
        LD A,($2010)  ; ROM $06CE: 3A 10 20
        LD (HL),A  ; ROM $06D1: 77
        JP $071A  ; ROM $06D2: C3 1A 07
NATIVE_06D5:
        LD A,($2007)  ; ROM $06D5: 3A 07 20
        AND A  ; ROM $06D8: A7
        RET Z  ; ROM $06D9: C8
        LD B,$03  ; ROM $06DA: 06 03
NATIVE_06DC:
        CALL $07F6  ; ROM $06DC: CD F6 07
        EX DE,HL  ; ROM $06DF: EB
        LD A,(DE)  ; ROM $06E0: 1A
        INC A  ; ROM $06E1: 3C
        JP NZ,$06F6  ; ROM $06E2: C2 F6 06
        CALL $07F6  ; ROM $06E5: CD F6 07
        LD A,(HL)  ; ROM $06E8: 7E
        CP $AA  ; ROM $06E9: FE AA
        JP NZ,$06F6  ; ROM $06EB: C2 F6 06
        CALL $07F6  ; ROM $06EE: CD F6 07
        LD A,(HL)  ; ROM $06F1: 7E
        INC A  ; ROM $06F2: 3C
        JP Z,$0708  ; ROM $06F3: CA 08 07
NATIVE_06F6:
        EX DE,HL  ; ROM $06F6: EB
        LD ($202B),HL  ; ROM $06F7: 22 2B 20
        PUSH BC  ; ROM $06FA: C5
        CALL $0520  ; ROM $06FB: CD 20 05
        POP BC  ; ROM $06FE: C1
        DEC C  ; ROM $06FF: 0D
        JP NZ,$06DC  ; ROM $0700: C2 DC 06
        DEC B  ; ROM $0703: 05
        JP NZ,$06DC  ; ROM $0704: C2 DC 06
        RET  ; ROM $0707: C9
NATIVE_0708:
        CALL $07F6  ; ROM $0708: CD F6 07
        LD A,($2007)  ; ROM $070B: 3A 07 20
        CP (HL)  ; ROM $070E: BE
        JP C,$06F6  ; ROM $070F: DA F6 06
        LD A,(HL)  ; ROM $0712: 7E
        AND A  ; ROM $0713: A7
        JP Z,$06F6  ; ROM $0714: CA F6 06
        LD ($2010),A  ; ROM $0717: 32 10 20
NATIVE_071A:
        CALL $0995  ; ROM $071A: CD 95 09
        LD A,($2010)  ; ROM $071D: 3A 10 20
        LD ($2011),A  ; ROM $0720: 32 11 20
        LD A,($2007)  ; ROM $0723: 3A 07 20
        LD ($2012),A  ; ROM $0726: 32 12 20
        LD A,($2006)  ; ROM $0729: 3A 06 20
        AND A  ; ROM $072C: A7
        JP Z,$0756  ; ROM $072D: CA 56 07
        LD DE,$0FDC  ; ROM $0730: 11 DC 0F
        CALL $0D73  ; ROM $0733: CD 73 0D
        LD HL,$2017  ; ROM $0736: 21 17 20
        LD (HL),$03  ; ROM $0739: 36 03
NATIVE_073B:
        LD A,(HL)  ; ROM $073B: 7E
        ADD A,$30  ; ROM $073C: C6 30
        LD DE,$2F8E  ; ROM $073E: 11 8E 2F
        CALL $044C  ; ROM $0741: CD 4C 04
        LD A,$1E  ; ROM $0744: 3E 1E
        RST $18  ; ROM $0746: DF
        LD HL,$2017  ; ROM $0747: 21 17 20
        DEC (HL)  ; ROM $074A: 35
        JP NZ,$073B  ; ROM $074B: C2 3B 07
        LD DE,$2F8E  ; ROM $074E: 11 8E 2F
        LD A,$40  ; ROM $0751: 3E 40
        CALL $044C  ; ROM $0753: CD 4C 04
NATIVE_0756:
        CALL $0AEE  ; ROM $0756: CD EE 0A
        LD A,($2006)  ; ROM $0759: 3A 06 20
        AND A  ; ROM $075C: A7
        JP Z,$076B  ; ROM $075D: CA 6B 07
        LD A,($2009)  ; ROM $0760: 3A 09 20
        DEC A  ; ROM $0763: 3D
        JP NZ,$0770  ; ROM $0764: C2 70 07
        LD A,($21C0)  ; ROM $0767: 3A C0 21
        AND A  ; ROM $076A: A7
NATIVE_076B:
        LD A,$02  ; ROM $076B: 3E 02
        JP Z,$0776  ; ROM $076D: CA 76 07
NATIVE_0770:
        LD HL,$2012  ; ROM $0770: 21 12 20
        LD A,$0B  ; ROM $0773: 3E 0B
        SUB (HL)  ; ROM $0775: 96
NATIVE_0776:
        LD ($21BF),A  ; ROM $0776: 32 BF 21
NATIVE_0779:
        LD HL,$0FA0  ; ROM $0779: 21 A0 0F
        RST $28  ; ROM $077C: EF
        LD A,(HL)  ; ROM $077D: 7E
        AND A  ; ROM $077E: A7
        JP NZ,$0789  ; ROM $077F: C2 89 07
        LD HL,$2011  ; ROM $0782: 21 11 20
        RST $20  ; ROM $0785: E7
        JP $0779  ; ROM $0786: C3 79 07
NATIVE_0789:
        PUSH HL  ; ROM $0789: E5
        CALL $0B3C  ; ROM $078A: CD 3C 0B
        AND A  ; ROM $078D: A7
        JP NZ,$0796  ; ROM $078E: C2 96 07
        LD A,$04  ; ROM $0791: 3E 04
        CALL $0CB4  ; ROM $0793: CD B4 0C
NATIVE_0796:
        PUSH HL  ; ROM $0796: E5
        CALL $07B3  ; ROM $0797: CD B3 07
        POP HL  ; ROM $079A: E1
        LD (HL),A  ; ROM $079B: 77
        POP HL  ; ROM $079C: E1
        CALL $080F  ; ROM $079D: CD 0F 08
        LD A,($2012)  ; ROM $07A0: 3A 12 20
        CP $02  ; ROM $07A3: FE 02
        JP NC,$07AC  ; ROM $07A5: D2 AC 07
        LD A,$78  ; ROM $07A8: 3E 78
        RST $18  ; ROM $07AA: DF
        RET  ; ROM $07AB: C9
NATIVE_07AC:
        LD HL,$2011  ; ROM $07AC: 21 11 20
        RST $20  ; ROM $07AF: E7
        JP $0756  ; ROM $07B0: C3 56 07
NATIVE_07B3:
        LD B,A  ; ROM $07B3: 47
        LD A,($2006)  ; ROM $07B4: 3A 06 20
        AND A  ; ROM $07B7: A7
        JP Z,$07D2  ; ROM $07B8: CA D2 07
        CALL $07E3  ; ROM $07BB: CD E3 07
        JP P,$07C3  ; ROM $07BE: F2 C3 07
        LD (HL),$00  ; ROM $07C1: 36 00
NATIVE_07C3:
        LD A,B  ; ROM $07C3: 78
        DEC A  ; ROM $07C4: 3D
NATIVE_07C5:
        DEC C  ; ROM $07C5: 0D
        JP M,$07CE  ; ROM $07C6: FA CE 07
        RLCA  ; ROM $07C9: 07
        RLCA  ; ROM $07CA: 07
        JP $07C5  ; ROM $07CB: C3 C5 07
NATIVE_07CE:
        OR (HL)  ; ROM $07CE: B6
        LD (HL),A  ; ROM $07CF: 77
        LD A,B  ; ROM $07D0: 78
        RET  ; ROM $07D1: C9
NATIVE_07D2:
        CALL $07E3  ; ROM $07D2: CD E3 07
        LD A,(HL)  ; ROM $07D5: 7E
NATIVE_07D6:
        DEC C  ; ROM $07D6: 0D
        JP M,$07DF  ; ROM $07D7: FA DF 07
        RRCA  ; ROM $07DA: 0F
        RRCA  ; ROM $07DB: 0F
        JP $07D6  ; ROM $07DC: C3 D6 07
NATIVE_07DF:
        AND $03  ; ROM $07DF: E6 03
        INC A  ; ROM $07E1: 3C
        RET  ; ROM $07E2: C9
NATIVE_07E3:
        LD HL,$21BD  ; ROM $07E3: 21 BD 21
        DEC (HL)  ; ROM $07E6: 35
        JP P,$07EC  ; ROM $07E7: F2 EC 07
        LD (HL),$03  ; ROM $07EA: 36 03
NATIVE_07EC:
        LD C,(HL)  ; ROM $07EC: 4E
        PUSH AF  ; ROM $07ED: F5
        CALL M,$07F6  ; ROM $07EE: FC F6 07
        POP AF  ; ROM $07F1: F1
        LD HL,($202B)  ; ROM $07F2: 2A 2B 20
        RET  ; ROM $07F5: C9
NATIVE_07F6:
        LD HL,($202B)  ; ROM $07F6: 2A 2B 20
        INC HL  ; ROM $07F9: 23
        PUSH AF  ; ROM $07FA: F5
        LD A,H  ; ROM $07FB: 7C
        CP $21  ; ROM $07FC: FE 21
        DB $C2,$0A ; ROM $07FE unclassified

        ORG $0800
; Device checkmat.f, SHA1 39e0cf502735819a7e1d933e3686945fcfae21af
        DB $08 ; ROM $0800 unclassified
        LD A,L  ; ROM $0801: 7D
        CP $BD  ; ROM $0802: FE BD
        JP NZ,$080A  ; ROM $0804: C2 0A 08
        LD HL,$202D  ; ROM $0807: 21 2D 20
NATIVE_080A:
        LD ($202B),HL  ; ROM $080A: 22 2B 20
        POP AF  ; ROM $080D: F1
        RET  ; ROM $080E: C9
NATIVE_080F:
        LD ($2013),HL  ; ROM $080F: 22 13 20
        LD BC,$0006  ; ROM $0812: 01 06 00
        ADD HL,BC  ; ROM $0815: 09
        PUSH HL  ; ROM $0816: E5
        PUSH HL  ; ROM $0817: E5
        LD C,(HL)  ; ROM $0818: 4E
        INC HL  ; ROM $0819: 23
        LD B,(HL)  ; ROM $081A: 46
        LD A,C  ; ROM $081B: 79
        OR B  ; ROM $081C: B0
        JP Z,$0826  ; ROM $081D: CA 26 08
        LD HL,$0F5C  ; ROM $0820: 21 5C 0F
        CALL $0D33  ; ROM $0823: CD 33 0D
NATIVE_0826:
        POP HL  ; ROM $0826: E1
        DEC HL  ; ROM $0827: 2B
        LD B,(HL)  ; ROM $0828: 46
        DEC HL  ; ROM $0829: 2B
        LD C,(HL)  ; ROM $082A: 4E
        EX (SP),HL  ; ROM $082B: E3
        LD (HL),C  ; ROM $082C: 71
        INC HL  ; ROM $082D: 23
        LD (HL),B  ; ROM $082E: 70
        PUSH BC  ; ROM $082F: C5
        LD HL,$0F54  ; ROM $0830: 21 54 0F
        CALL $0D33  ; ROM $0833: CD 33 0D
        LD HL,($2013)  ; ROM $0836: 2A 13 20
        INC HL  ; ROM $0839: 23
        INC HL  ; ROM $083A: 23
        INC HL  ; ROM $083B: 23
        LD A,(HL)  ; ROM $083C: 7E
        LD ($2018),A  ; ROM $083D: 32 18 20
        LD HL,$0FB0  ; ROM $0840: 21 B0 0F
        CALL $0C9C  ; ROM $0843: CD 9C 0C
        POP BC  ; ROM $0846: C1
        LD A,H  ; ROM $0847: 7C
        ADD A,B  ; ROM $0848: 80
        LD B,A  ; ROM $0849: 47
        LD A,L  ; ROM $084A: 7D
        ADD A,C  ; ROM $084B: 81
        LD C,A  ; ROM $084C: 4F
        POP HL  ; ROM $084D: E1
        LD (HL),C  ; ROM $084E: 71
        INC HL  ; ROM $084F: 23
        LD (HL),B  ; ROM $0850: 70
        CALL $0C59  ; ROM $0851: CD 59 0C
        JP NZ,$088C  ; ROM $0854: C2 8C 08
        LD A,($2011)  ; ROM $0857: 3A 11 20
        CALL $0C3B  ; ROM $085A: CD 3B 0C
        LD A,($2018)  ; ROM $085D: 3A 18 20
        LD HL,$0F64  ; ROM $0860: 21 64 0F
        CALL $0C9C  ; ROM $0863: CD 9C 0C
        CALL $0D34  ; ROM $0866: CD 34 0D
        LD A,($2011)  ; ROM $0869: 3A 11 20
        DEC A  ; ROM $086C: 3D
        AND $03  ; ROM $086D: E6 03
        RLCA  ; ROM $086F: 07
        RLCA  ; ROM $0870: 07
        LD B,A  ; ROM $0871: 47
        LD A,($2018)  ; ROM $0872: 3A 18 20
        DEC A  ; ROM $0875: 3D
        OR B  ; ROM $0876: B0
        RLCA  ; ROM $0877: 07
        RLCA  ; ROM $0878: 07
        RLCA  ; ROM $0879: 07
        RLCA  ; ROM $087A: 07
        OR $09  ; ROM $087B: F6 09
        LD B,A  ; ROM $087D: 47
        LD C,$05  ; ROM $087E: 0E 05
        JP $0D5B  ; ROM $0880: C3 5B 0D
        DB $2A,$00,$00,$00,$00,$00,$00,$00,$00 ; ROM $0883 unclassified
NATIVE_088C:
        CALL $0C83  ; ROM $088C: CD 83 0C
        LD ($2015),HL  ; ROM $088F: 22 15 20
        LD BC,$0A28  ; ROM $0892: 01 28 0A
        CALL $0D5B  ; ROM $0895: CD 5B 0D
        LD HL,$0E44  ; ROM $0898: 21 44 0E
        CALL $0DE8  ; ROM $089B: CD E8 0D
        JP (HL)  ; ROM $089E: E9
        DB $3E,$FF,$32,$E8,$21,$11,$61,$3E,$21,$54,$0E,$CD ; ROM $089F unclassified
        DB $C9,$0D,$13,$21,$FF,$0E,$EF,$CD,$C9,$0D,$13,$CD ; ROM $08AB unclassified
        DB $91,$0D,$E6,$03,$21,$18,$0F,$CD,$9C,$0C,$CD,$C9 ; ROM $08B7 unclassified
        DB $0D,$AF,$32,$E8,$21,$2A,$15,$20,$11,$E0,$21,$CD ; ROM $08C3 unclassified
        DB $4A,$0D,$11,$D4,$04,$1A,$13,$A7,$CA,$E6,$08,$F5 ; ROM $08CF unclassified
        DB $2A,$15,$20,$CD,$39,$0D,$F1,$DF,$C3,$D4,$08,$2A ; ROM $08DB unclassified
        DB $15,$20,$11,$E0,$21,$CD,$39,$0D,$2A,$13,$20,$36 ; ROM $08E7 unclassified
        DB $00,$3A,$06,$20,$A7,$CA,$26,$09,$3A,$11,$20,$F5 ; ROM $08F3 unclassified
        DB $3A,$07,$20,$32,$11,$20,$21,$A0,$0F,$EF,$7E,$A7 ; ROM $08FF unclassified
        DB $CA,$1B,$09,$21,$26,$20,$CD,$8E,$0C,$7E,$3C,$27 ; ROM $090B unclassified
        DB $77,$CD,$CA,$0C,$21,$11,$20,$35,$C2,$05,$09,$F1 ; ROM $0917 unclassified
        DB $32,$11,$20,$21,$12,$20,$35,$06,$19,$0E,$1F,$3A ; ROM $0923 unclassified
        DB $11,$20,$5F,$CD,$59,$0C,$BB,$C2,$48,$09,$AF,$CD ; ROM $092F unclassified
        DB $3B,$0C,$CD,$83,$0C,$C5,$06,$08,$AF,$CD,$DF,$0C ; ROM $093B unclassified
        DB $C1,$0D,$F2,$2E,$09,$05,$F2,$2C,$09,$3E,$04,$32 ; ROM $0947 unclassified
        DB $17,$20,$3A,$12,$20,$32,$19,$20,$32,$1A,$20,$21 ; ROM $0953 unclassified
        DB $1A,$20,$E7,$7E,$21,$A0,$0F,$CD,$9C,$0C,$7E,$A7 ; ROM $095F unclassified
        DB $CA,$5E,$09,$2A,$0E,$20,$3A,$1A,$20,$CD,$9C,$0C ; ROM $096B unclassified
        DB $CD,$E9,$0C,$21,$19,$20,$35,$C2,$5E,$09,$3E,$1E ; ROM $0977 unclassified
        DB $DF,$21,$17,$20,$35,$C2,$55,$09,$11,$00,$40,$21 ; ROM $0983 unclassified
        DB $0E,$FF,$CD,$11,$0D,$C9 ; ROM $098F unclassified
NATIVE_0995:
        LD DE,$4000  ; ROM $0995: 11 00 40
        LD HL,$FF0E  ; ROM $0998: 21 0E FF
        CALL $0D11  ; ROM $099B: CD 11 0D
        LD DE,$3E40  ; ROM $099E: 11 40 3E
        LD HL,$00B8  ; ROM $09A1: 21 B8 00
        CALL $0D11  ; ROM $09A4: CD 11 0D
        LD DE,$2740  ; ROM $09A7: 11 40 27
        LD HL,$FF1A  ; ROM $09AA: 21 1A FF
        CALL $0D11  ; ROM $09AD: CD 11 0D
        LD HL,$2740  ; ROM $09B0: 21 40 27
        LD B,$B8  ; ROM $09B3: 06 B8
        CALL $0CDD  ; ROM $09B5: CD DD 0C
        LD HL,$275F  ; ROM $09B8: 21 5F 27
        LD B,$B8  ; ROM $09BB: 06 B8
        CALL $0CDD  ; ROM $09BD: CD DD 0C
        LD HL,$21BD  ; ROM $09C0: 21 BD 21
        LD BC,$02C1  ; ROM $09C3: 01 C1 02
        CALL $0514  ; ROM $09C6: CD 14 05
        LD C,$1F  ; ROM $09C9: 0E 1F
        LD E,$0F  ; ROM $09CB: 1E 0F
NATIVE_09CD:
        LD B,$00  ; ROM $09CD: 06 00
        LD A,E  ; ROM $09CF: 7B
        CALL $0C3B  ; ROM $09D0: CD 3B 0C
        LD B,$18  ; ROM $09D3: 06 18
        LD A,E  ; ROM $09D5: 7B
        CALL $0C3B  ; ROM $09D6: CD 3B 0C
        DEC C  ; ROM $09D9: 0D
        JP P,$09CD  ; ROM $09DA: F2 CD 09
        LD B,$18  ; ROM $09DD: 06 18
NATIVE_09DF:
        LD C,$00  ; ROM $09DF: 0E 00
        LD A,E  ; ROM $09E1: 7B
        CALL $0C3B  ; ROM $09E2: CD 3B 0C
        LD C,$1F  ; ROM $09E5: 0E 1F
        LD A,E  ; ROM $09E7: 7B
        CALL $0C3B  ; ROM $09E8: CD 3B 0C
        DEC B  ; ROM $09EB: 05
        JP P,$09DF  ; ROM $09EC: F2 DF 09
        LD A,($2006)  ; ROM $09EF: 3A 06 20
        AND A  ; ROM $09F2: A7
        JP Z,$0A08  ; ROM $09F3: CA 08 0A
        LD A,$FF  ; ROM $09F6: 3E FF
        LD ($21E8),A  ; ROM $09F8: 32 E8 21
        LD HL,$2008  ; ROM $09FB: 21 08 20
        LD DE,$250F  ; ROM $09FE: 11 0F 25
        CALL $03E5  ; ROM $0A01: CD E5 03
        XOR A  ; ROM $0A04: AF
        LD ($21E8),A  ; ROM $0A05: 32 E8 21
NATIVE_0A08:
        INC A  ; ROM $0A08: 3C
        LD ($2017),A  ; ROM $0A09: 32 17 20
        LD A,($2010)  ; ROM $0A0C: 3A 10 20
        LD ($2011),A  ; ROM $0A0F: 32 11 20
        LD A,($2007)  ; ROM $0A12: 3A 07 20
NATIVE_0A15:
        PUSH AF  ; ROM $0A15: F5
        LD HL,($200E)  ; ROM $0A16: 2A 0E 20
        RST $28  ; ROM $0A19: EF
        PUSH HL  ; ROM $0A1A: E5
        PUSH HL  ; ROM $0A1B: E5
        CALL $0CE9  ; ROM $0A1C: CD E9 0C
        LD HL,$0F6C  ; ROM $0A1F: 21 6C 0F
        RST $28  ; ROM $0A22: EF
        EX (SP),HL  ; ROM $0A23: E3
        LD BC,$0161  ; ROM $0A24: 01 61 01
        ADD HL,BC  ; ROM $0A27: 09
        EX DE,HL  ; ROM $0A28: EB
        POP HL  ; ROM $0A29: E1
        CALL $0DC9  ; ROM $0A2A: CD C9 0D
        CALL $0CCA  ; ROM $0A2D: CD CA 0C
        LD HL,$0F80  ; ROM $0A30: 21 80 0F
        RST $28  ; ROM $0A33: EF
        POP DE  ; ROM $0A34: D1
        INC DE  ; ROM $0A35: 13
        CALL $0DC9  ; ROM $0A36: CD C9 0D
        LD A,($2017)  ; ROM $0A39: 3A 17 20
        LD HL,$0FC0  ; ROM $0A3C: 21 C0 0F
        CALL $0C9C  ; ROM $0A3F: CD 9C 0C
        EX DE,HL  ; ROM $0A42: EB
        LD HL,$0FA0  ; ROM $0A43: 21 A0 0F
        RST $28  ; ROM $0A46: EF
        LD (HL),$01  ; ROM $0A47: 36 01
        INC HL  ; ROM $0A49: 23
        LD (HL),$01  ; ROM $0A4A: 36 01
        LD A,($2009)  ; ROM $0A4C: 3A 09 20
        CP $01  ; ROM $0A4F: FE 01
        JP NZ,$0A55  ; ROM $0A51: C2 55 0A
        DEC (HL)  ; ROM $0A54: 35
NATIVE_0A55:
        INC HL  ; ROM $0A55: 23
        INC HL  ; ROM $0A56: 23
        INC HL  ; ROM $0A57: 23
        LD (HL),E  ; ROM $0A58: 73
        INC HL  ; ROM $0A59: 23
        LD (HL),D  ; ROM $0A5A: 72
        INC HL  ; ROM $0A5B: 23
        LD B,D  ; ROM $0A5C: 42
        LD C,E  ; ROM $0A5D: 4B
        PUSH HL  ; ROM $0A5E: E5
        LD HL,$0FA8  ; ROM $0A5F: 21 A8 0F
        RST $28  ; ROM $0A62: EF
        EX DE,HL  ; ROM $0A63: EB
        POP HL  ; ROM $0A64: E1
        LD (HL),E  ; ROM $0A65: 73
        INC HL  ; ROM $0A66: 23
        LD (HL),D  ; ROM $0A67: 72
        LD A,($2011)  ; ROM $0A68: 3A 11 20
        CALL $0C3B  ; ROM $0A6B: CD 3B 0C
        LD HL,$2017  ; ROM $0A6E: 21 17 20
        INC (HL)  ; ROM $0A71: 34
        LD HL,$2011  ; ROM $0A72: 21 11 20
        RST $20  ; ROM $0A75: E7
        POP AF  ; ROM $0A76: F1
        DEC A  ; ROM $0A77: 3D
        JP NZ,$0A15  ; ROM $0A78: C2 15 0A
        LD A,($2007)  ; ROM $0A7B: 3A 07 20
        LD ($2012),A  ; ROM $0A7E: 32 12 20
NATIVE_0A81:
        LD A,($2007)  ; ROM $0A81: 3A 07 20
        LD ($2017),A  ; ROM $0A84: 32 17 20
NATIVE_0A87:
        LD HL,$0FA0  ; ROM $0A87: 21 A0 0F
        RST $28  ; ROM $0A8A: EF
        LD DE,$0004  ; ROM $0A8B: 11 04 00
        ADD HL,DE  ; ROM $0A8E: 19
        LD E,(HL)  ; ROM $0A8F: 5E
        INC HL  ; ROM $0A90: 23
        LD D,(HL)  ; ROM $0A91: 56
        INC HL  ; ROM $0A92: 23
        LD C,(HL)  ; ROM $0A93: 4E
        INC HL  ; ROM $0A94: 23
        LD B,(HL)  ; ROM $0A95: 46
        LD A,B  ; ROM $0A96: 78
        OR C  ; ROM $0A97: B1
        JP Z,$0AD4  ; ROM $0A98: CA D4 0A
        LD A,B  ; ROM $0A9B: 78
        CP D  ; ROM $0A9C: BA
        JP NZ,$0AB0  ; ROM $0A9D: C2 B0 0A
        LD A,C  ; ROM $0AA0: 79
        XOR E  ; ROM $0AA1: AB
        JP NZ,$0AB0  ; ROM $0AA2: C2 B0 0A
        LD (HL),A  ; ROM $0AA5: 77
        DEC HL  ; ROM $0AA6: 2B
        LD (HL),A  ; ROM $0AA7: 77
        LD HL,$2012  ; ROM $0AA8: 21 12 20
        DEC (HL)  ; ROM $0AAB: 35
        JP NZ,$0AD4  ; ROM $0AAC: C2 D4 0A
        RET  ; ROM $0AAF: C9
NATIVE_0AB0:
        PUSH HL  ; ROM $0AB0: E5
        CALL $0C83  ; ROM $0AB1: CD 83 0C
        PUSH DE  ; ROM $0AB4: D5
        PUSH BC  ; ROM $0AB5: C5
        LD B,$08  ; ROM $0AB6: 06 08
        XOR A  ; ROM $0AB8: AF
        CALL $0CDF  ; ROM $0AB9: CD DF 0C
        POP BC  ; ROM $0ABC: C1
        POP DE  ; ROM $0ABD: D1
        LD A,B  ; ROM $0ABE: 78
        CP D  ; ROM $0ABF: BA
        CALL $0AE5  ; ROM $0AC0: CD E5 0A
        LD B,A  ; ROM $0AC3: 47
        LD A,C  ; ROM $0AC4: 79
        CP E  ; ROM $0AC5: BB
        CALL $0AE5  ; ROM $0AC6: CD E5 0A
        LD C,A  ; ROM $0AC9: 4F
        POP HL  ; ROM $0ACA: E1
        LD (HL),B  ; ROM $0ACB: 70
        DEC HL  ; ROM $0ACC: 2B
        LD (HL),C  ; ROM $0ACD: 71
        LD HL,$0F54  ; ROM $0ACE: 21 54 0F
        CALL $0D33  ; ROM $0AD1: CD 33 0D
NATIVE_0AD4:
        LD HL,$2011  ; ROM $0AD4: 21 11 20
        RST $20  ; ROM $0AD7: E7
        LD HL,$2017  ; ROM $0AD8: 21 17 20
        DEC (HL)  ; ROM $0ADB: 35
        JP NZ,$0A87  ; ROM $0ADC: C2 87 0A
        LD A,$06  ; ROM $0ADF: 3E 06
        RST $18  ; ROM $0AE1: DF
        JP $0A81  ; ROM $0AE2: C3 81 0A
NATIVE_0AE5:
        RET Z  ; ROM $0AE5: C8
        JP C,$0AEB  ; ROM $0AE6: DA EB 0A
        DEC A  ; ROM $0AE9: 3D
        RET  ; ROM $0AEA: C9
NATIVE_0AEB:
        INC A  ; ROM $0AEB: 3C
        RET  ; ROM $0AEC: C9
        DB $C9 ; ROM $0AED unclassified
NATIVE_0AEE:
        LD A,($2011)  ; ROM $0AEE: 3A 11 20
        LD ($201A),A  ; ROM $0AF1: 32 1A 20
NATIVE_0AF4:
        CALL $0520  ; ROM $0AF4: CD 20 05
        LD A,($21BF)  ; ROM $0AF7: 3A BF 21
        AND A  ; ROM $0AFA: A7
        RET Z  ; ROM $0AFB: C8
        LD A,($2006)  ; ROM $0AFC: 3A 06 20
        AND A  ; ROM $0AFF: A7
        JP Z,$0AF4  ; ROM $0B00: CA F4 0A
        LD A,($201A)  ; ROM $0B03: 3A 1A 20
        LD HL,$0FA0  ; ROM $0B06: 21 A0 0F
        CALL $0C9C  ; ROM $0B09: CD 9C 0C
        LD A,(HL)  ; ROM $0B0C: 7E
        AND A  ; ROM $0B0D: A7
        JP Z,$0B35  ; ROM $0B0E: CA 35 0B
        PUSH HL  ; ROM $0B11: E5
        LD BC,$0006  ; ROM $0B12: 01 06 00
        ADD HL,BC  ; ROM $0B15: 09
        LD A,(HL)  ; ROM $0B16: 7E
        INC HL  ; ROM $0B17: 23
        OR (HL)  ; ROM $0B18: B6
        POP HL  ; ROM $0B19: E1
        JP Z,$0B35  ; ROM $0B1A: CA 35 0B
        INC HL  ; ROM $0B1D: 23
        LD A,(HL)  ; ROM $0B1E: 7E
        AND A  ; ROM $0B1F: A7
        JP Z,$0B35  ; ROM $0B20: CA 35 0B
        DEC HL  ; ROM $0B23: 2B
        CALL $0B3C  ; ROM $0B24: CD 3C 0B
        LD HL,$0F64  ; ROM $0B27: 21 64 0F
        CALL $0C9C  ; ROM $0B2A: CD 9C 0C
        PUSH HL  ; ROM $0B2D: E5
        CALL $0C83  ; ROM $0B2E: CD 83 0C
        POP DE  ; ROM $0B31: D1
        CALL $0D39  ; ROM $0B32: CD 39 0D
NATIVE_0B35:
        LD HL,$201A  ; ROM $0B35: 21 1A 20
        RST $20  ; ROM $0B38: E7
        JP $0AF4  ; ROM $0B39: C3 F4 0A
NATIVE_0B3C:
        INC HL  ; ROM $0B3C: 23
        LD D,(HL)  ; ROM $0B3D: 56
        INC HL  ; ROM $0B3E: 23
        PUSH HL  ; ROM $0B3F: E5
        INC HL  ; ROM $0B40: 23
        LD E,(HL)  ; ROM $0B41: 5E
        INC HL  ; ROM $0B42: 23
        LD C,(HL)  ; ROM $0B43: 4E
        INC HL  ; ROM $0B44: 23
        LD B,(HL)  ; ROM $0B45: 46
        LD A,D  ; ROM $0B46: 7A
        AND A  ; ROM $0B47: A7
        JP NZ,$0BAB  ; ROM $0B48: C2 AB 0B
        XOR A  ; ROM $0B4B: AF
        LD ($201B),A  ; ROM $0B4C: 32 1B 20
        LD ($2021),A  ; ROM $0B4F: 32 21 20
        LD HL,$21E9  ; ROM $0B52: 21 E9 21
        INC (HL)  ; ROM $0B55: 34
        PUSH DE  ; ROM $0B56: D5
        LD E,$05  ; ROM $0B57: 1E 05
        CALL $0BCF  ; ROM $0B59: CD CF 0B
        POP DE  ; ROM $0B5C: D1
        LD HL,$21E9  ; ROM $0B5D: 21 E9 21
        DEC (HL)  ; ROM $0B60: 35
        LD HL,$2021  ; ROM $0B61: 21 21 20
        LD A,(HL)  ; ROM $0B64: 7E
        AND A  ; ROM $0B65: A7
        JP Z,$0B96  ; ROM $0B66: CA 96 0B
        LD HL,$21E9  ; ROM $0B69: 21 E9 21
        PUSH AF  ; ROM $0B6C: F5
        CALL $0C8E  ; ROM $0B6D: CD 8E 0C
        POP AF  ; ROM $0B70: F1
        DEC (HL)  ; ROM $0B71: 35
        JP P,$0B80  ; ROM $0B72: F2 80 0B
        CALL $0D91  ; ROM $0B75: CD 91 0D
        AND $0F  ; ROM $0B78: E6 0F
        ADD A,$0A  ; ROM $0B7A: C6 0A
        LD (HL),A  ; ROM $0B7C: 77
        JP $0B8F  ; ROM $0B7D: C3 8F 0B
NATIVE_0B80:
        LD HL,$2021  ; ROM $0B80: 21 21 20
        LD D,A  ; ROM $0B83: 57
        LD A,E  ; ROM $0B84: 7B
        LD E,D  ; ROM $0B85: 5A
NATIVE_0B86:
        INC HL  ; ROM $0B86: 23
        CP (HL)  ; ROM $0B87: BE
        JP Z,$0BA7  ; ROM $0B88: CA A7 0B
        DEC D  ; ROM $0B8B: 15
        JP NZ,$0B86  ; ROM $0B8C: C2 86 0B
NATIVE_0B8F:
        LD HL,$2021  ; ROM $0B8F: 21 21 20
        LD A,(HL)  ; ROM $0B92: 7E
        JP $0B9E  ; ROM $0B93: C3 9E 0B
NATIVE_0B96:
        LD HL,$201B  ; ROM $0B96: 21 1B 20
        LD A,(HL)  ; ROM $0B99: 7E
        AND A  ; ROM $0B9A: A7
        JP Z,$0BA7  ; ROM $0B9B: CA A7 0B
NATIVE_0B9E:
        CALL $0CB4  ; ROM $0B9E: CD B4 0C
        CALL $0C91  ; ROM $0BA1: CD 91 0C
        POP HL  ; ROM $0BA4: E1
        INC HL  ; ROM $0BA5: 23
        RET  ; ROM $0BA6: C9
NATIVE_0BA7:
        POP HL  ; ROM $0BA7: E1
        INC HL  ; ROM $0BA8: 23
        LD A,(HL)  ; ROM $0BA9: 7E
        RET  ; ROM $0BAA: C9
NATIVE_0BAB:
        CALL $0BCD  ; ROM $0BAB: CD CD 0B
        POP HL  ; ROM $0BAE: E1
        LD A,(HL)  ; ROM $0BAF: 7E
        INC HL  ; ROM $0BB0: 23
        AND D  ; ROM $0BB1: A2
        LD D,A  ; ROM $0BB2: 57
        LD A,E  ; ROM $0BB3: 7B
        RET Z  ; ROM $0BB4: C8
        CP $03  ; ROM $0BB5: FE 03
        LD A,D  ; ROM $0BB7: 7A
        JP C,$0BC4  ; ROM $0BB8: DA C4 0B
        LD E,$00  ; ROM $0BBB: 1E 00
NATIVE_0BBD:
        INC E  ; ROM $0BBD: 1C
        RRCA  ; ROM $0BBE: 0F
        JP NC,$0BBD  ; ROM $0BBF: D2 BD 0B
        LD A,E  ; ROM $0BC2: 7B
        RET  ; ROM $0BC3: C9
NATIVE_0BC4:
        LD E,$09  ; ROM $0BC4: 1E 09
NATIVE_0BC6:
        DEC E  ; ROM $0BC6: 1D
        RLCA  ; ROM $0BC7: 07
        JP NC,$0BC6  ; ROM $0BC8: D2 C6 0B
        LD A,E  ; ROM $0BCB: 7B
        RET  ; ROM $0BCC: C9
NATIVE_0BCD:
        LD D,$00  ; ROM $0BCD: 16 00
NATIVE_0BCF:
        CALL $0BDD  ; ROM $0BCF: CD DD 0B
NATIVE_0BD2:
        INC B  ; ROM $0BD2: 04
        CALL $0BE8  ; ROM $0BD3: CD E8 0B
        DEC B  ; ROM $0BD6: 05
        DEC B  ; ROM $0BD7: 05
        CALL $0BE8  ; ROM $0BD8: CD E8 0B
        INC B  ; ROM $0BDB: 04
        RET  ; ROM $0BDC: C9
NATIVE_0BDD:
        INC C  ; ROM $0BDD: 0C
        CALL $0BE8  ; ROM $0BDE: CD E8 0B
        DEC C  ; ROM $0BE1: 0D
        DEC C  ; ROM $0BE2: 0D
        CALL $0BE8  ; ROM $0BE3: CD E8 0B
        INC C  ; ROM $0BE6: 0C
        RET  ; ROM $0BE7: C9
NATIVE_0BE8:
        LD A,($21E9)  ; ROM $0BE8: 3A E9 21
        AND A  ; ROM $0BEB: A7
        JP NZ,$0BFD  ; ROM $0BEC: C2 FD 0B
        PUSH HL  ; ROM $0BEF: E5
        CALL $0C59  ; ROM $0BF0: CD 59 0C
        LD A,D  ; ROM $0BF3: 7A
        JP NZ,$0BF9  ; ROM $0BF4: C2 F9 0B
        OR $80  ; ROM $0BF7: F6 80
NATIVE_0BF9:
        RLCA  ; ROM $0BF9: 07
        LD D,A  ; ROM $0BFA: 57
        POP HL  ; ROM $0BFB: E1
        RET  ; ROM $0BFC: C9
NATIVE_0BFD:
        DEC A  ; ROM $0BFD: 3D
        DB $C2,$35 ; ROM $0BFE unclassified

        ORG $0C00
; Device checkmat.e, SHA1 453f95dd31968d439339c41e625481170437eb0f
        DB $0C ; ROM $0C00 unclassified
        DEC E  ; ROM $0C01: 1D
        CALL $0C59  ; ROM $0C02: CD 59 0C
        RET NZ  ; ROM $0C05: C0
        LD HL,$201B  ; ROM $0C06: 21 1B 20
        INC (HL)  ; ROM $0C09: 34
        LD A,(HL)  ; ROM $0C0A: 7E
        CALL $0C91  ; ROM $0C0B: CD 91 0C
        LD (HL),E  ; ROM $0C0E: 73
        LD HL,$21E9  ; ROM $0C0F: 21 E9 21
        INC (HL)  ; ROM $0C12: 34
        LD A,E  ; ROM $0C13: 7B
        LD D,$00  ; ROM $0C14: 16 00
        CP $03  ; ROM $0C16: FE 03
        JP C,$0C21  ; ROM $0C18: DA 21 0C
        CALL $0BD2  ; ROM $0C1B: CD D2 0B
        JP $0C24  ; ROM $0C1E: C3 24 0C
NATIVE_0C21:
        CALL $0BDD  ; ROM $0C21: CD DD 0B
NATIVE_0C24:
        LD HL,$21E9  ; ROM $0C24: 21 E9 21
        DEC (HL)  ; ROM $0C27: 35
        LD A,D  ; ROM $0C28: 7A
        AND A  ; ROM $0C29: A7
        RET Z  ; ROM $0C2A: C8
        LD HL,$2021  ; ROM $0C2B: 21 21 20
        INC (HL)  ; ROM $0C2E: 34
        LD A,(HL)  ; ROM $0C2F: 7E
        CALL $0C91  ; ROM $0C30: CD 91 0C
        LD (HL),E  ; ROM $0C33: 73
        RET  ; ROM $0C34: C9
NATIVE_0C35:
        CALL $0C59  ; ROM $0C35: CD 59 0C
        RET NZ  ; ROM $0C38: C0
        INC D  ; ROM $0C39: 14
        RET  ; ROM $0C3A: C9
NATIVE_0C3B:
        PUSH HL  ; ROM $0C3B: E5
        PUSH DE  ; ROM $0C3C: D5
        PUSH AF  ; ROM $0C3D: F5
        CALL $0C6B  ; ROM $0C3E: CD 6B 0C
        LD A,(HL)  ; ROM $0C41: 7E
        JP C,$0C50  ; ROM $0C42: DA 50 0C
        AND $0F  ; ROM $0C45: E6 0F
        LD E,A  ; ROM $0C47: 5F
        POP AF  ; ROM $0C48: F1
        RLCA  ; ROM $0C49: 07
        RLCA  ; ROM $0C4A: 07
        RLCA  ; ROM $0C4B: 07
        RLCA  ; ROM $0C4C: 07
        JP $0C54  ; ROM $0C4D: C3 54 0C
NATIVE_0C50:
        AND $F0  ; ROM $0C50: E6 F0
        LD E,A  ; ROM $0C52: 5F
        POP AF  ; ROM $0C53: F1
NATIVE_0C54:
        OR E  ; ROM $0C54: B3
        LD (HL),A  ; ROM $0C55: 77
        POP DE  ; ROM $0C56: D1
        POP HL  ; ROM $0C57: E1
        RET  ; ROM $0C58: C9
NATIVE_0C59:
        PUSH HL  ; ROM $0C59: E5
        PUSH DE  ; ROM $0C5A: D5
        CALL $0C6B  ; ROM $0C5B: CD 6B 0C
        LD A,(HL)  ; ROM $0C5E: 7E
        JP C,$0C66  ; ROM $0C5F: DA 66 0C
        RRCA  ; ROM $0C62: 0F
        RRCA  ; ROM $0C63: 0F
        RRCA  ; ROM $0C64: 0F
        RRCA  ; ROM $0C65: 0F
NATIVE_0C66:
        AND $0F  ; ROM $0C66: E6 0F
        POP DE  ; ROM $0C68: D1
        POP HL  ; ROM $0C69: E1
        RET  ; ROM $0C6A: C9
NATIVE_0C6B:
        LD A,B  ; ROM $0C6B: 78
        RLCA  ; ROM $0C6C: 07
        RLCA  ; ROM $0C6D: 07
        RLCA  ; ROM $0C6E: 07
        RLCA  ; ROM $0C6F: 07
        LD E,A  ; ROM $0C70: 5F
        AND $01  ; ROM $0C71: E6 01
        LD D,A  ; ROM $0C73: 57
        LD A,E  ; ROM $0C74: 7B
        AND $F0  ; ROM $0C75: E6 F0
        LD E,A  ; ROM $0C77: 5F
        LD A,C  ; ROM $0C78: 79
        RRA  ; ROM $0C79: 1F
        PUSH AF  ; ROM $0C7A: F5
        OR E  ; ROM $0C7B: B3
        LD E,A  ; ROM $0C7C: 5F
        LD HL,$21EE  ; ROM $0C7D: 21 EE 21
        ADD HL,DE  ; ROM $0C80: 19
        POP AF  ; ROM $0C81: F1
        RET  ; ROM $0C82: C9
NATIVE_0C83:
        PUSH AF  ; ROM $0C83: F5
        LD A,C  ; ROM $0C84: 79
        ADD A,$40  ; ROM $0C85: C6 40
        LD L,A  ; ROM $0C87: 6F
        LD A,B  ; ROM $0C88: 78
        ADC A,$26  ; ROM $0C89: CE 26
        LD H,A  ; ROM $0C8B: 67
        POP AF  ; ROM $0C8C: F1
        RET  ; ROM $0C8D: C9
NATIVE_0C8E:
        LD A,($2011)  ; ROM $0C8E: 3A 11 20
NATIVE_0C91:
        PUSH DE  ; ROM $0C91: D5
        LD E,A  ; ROM $0C92: 5F
        LD D,$00  ; ROM $0C93: 16 00
        ADD HL,DE  ; ROM $0C95: 19
        POP DE  ; ROM $0C96: D1
        LD A,(HL)  ; ROM $0C97: 7E
        RET  ; ROM $0C98: C9
NATIVE_0C99:
        LD A,($2011)  ; ROM $0C99: 3A 11 20
NATIVE_0C9C:
        RLCA  ; ROM $0C9C: 07
        PUSH DE  ; ROM $0C9D: D5
        LD E,A  ; ROM $0C9E: 5F
        LD D,$00  ; ROM $0C9F: 16 00
        ADD HL,DE  ; ROM $0CA1: 19
        LD E,(HL)  ; ROM $0CA2: 5E
        INC HL  ; ROM $0CA3: 23
        LD D,(HL)  ; ROM $0CA4: 56
        EX DE,HL  ; ROM $0CA5: EB
        POP DE  ; ROM $0CA6: D1
        RET  ; ROM $0CA7: C9
NATIVE_0CA8:
        LD A,($2007)  ; ROM $0CA8: 3A 07 20
        CP (HL)  ; ROM $0CAB: BE
        JP Z,$0CB1  ; ROM $0CAC: CA B1 0C
        INC (HL)  ; ROM $0CAF: 34
        RET  ; ROM $0CB0: C9
NATIVE_0CB1:
        LD (HL),$01  ; ROM $0CB1: 36 01
        RET  ; ROM $0CB3: C9
NATIVE_0CB4:
        PUSH HL  ; ROM $0CB4: E5
        PUSH DE  ; ROM $0CB5: D5
        PUSH AF  ; ROM $0CB6: F5
        CALL $0D91  ; ROM $0CB7: CD 91 0D
        LD E,A  ; ROM $0CBA: 5F
        LD D,$00  ; ROM $0CBB: 16 00
        LD H,D  ; ROM $0CBD: 62
        LD L,D  ; ROM $0CBE: 6A
        POP AF  ; ROM $0CBF: F1
NATIVE_0CC0:
        ADD HL,DE  ; ROM $0CC0: 19
        DEC A  ; ROM $0CC1: 3D
        JP NZ,$0CC0  ; ROM $0CC2: C2 C0 0C
        LD A,H  ; ROM $0CC5: 7C
        INC A  ; ROM $0CC6: 3C
        POP DE  ; ROM $0CC7: D1
        POP HL  ; ROM $0CC8: E1
        RET  ; ROM $0CC9: C9
NATIVE_0CCA:
        LD HL,($200E)  ; ROM $0CCA: 2A 0E 20
        RST $28  ; ROM $0CCD: EF
        LD BC,$0165  ; ROM $0CCE: 01 65 01
        ADD HL,BC  ; ROM $0CD1: 09
        PUSH HL  ; ROM $0CD2: E5
        LD HL,$2026  ; ROM $0CD3: 21 26 20
        CALL $0C8E  ; ROM $0CD6: CD 8E 0C
        POP DE  ; ROM $0CD9: D1
        JP $03E5  ; ROM $0CDA: C3 E5 03
NATIVE_0CDD:
        LD A,$FF  ; ROM $0CDD: 3E FF
NATIVE_0CDF:
        LD DE,$0020  ; ROM $0CDF: 11 20 00
NATIVE_0CE2:
        LD (HL),A  ; ROM $0CE2: 77
        ADD HL,DE  ; ROM $0CE3: 19
        DEC B  ; ROM $0CE4: 05
        JP NZ,$0CE2  ; ROM $0CE5: C2 E2 0C
        RET  ; ROM $0CE8: C9
NATIVE_0CE9:
        LD DE,$0140  ; ROM $0CE9: 11 40 01
        ADD HL,DE  ; ROM $0CEC: 19
        LD DE,$0019  ; ROM $0CED: 11 19 00
        LD B,$0C  ; ROM $0CF0: 06 0C
NATIVE_0CF2:
        LD A,(HL)  ; ROM $0CF2: 7E
        XOR $C0  ; ROM $0CF3: EE C0
        LD (HL),A  ; ROM $0CF5: 77
        INC HL  ; ROM $0CF6: 23
        LD C,$06  ; ROM $0CF7: 0E 06
NATIVE_0CF9:
        LD A,(HL)  ; ROM $0CF9: 7E
        CPL  ; ROM $0CFA: 2F
        LD (HL),A  ; ROM $0CFB: 77
        INC HL  ; ROM $0CFC: 23
        DEC C  ; ROM $0CFD: 0D
        JP NZ,$0CF9  ; ROM $0CFE: C2 F9 0C
        LD A,(HL)  ; ROM $0D01: 7E
        XOR $03  ; ROM $0D02: EE 03
        LD (HL),A  ; ROM $0D04: 77
        ADD HL,DE  ; ROM $0D05: 19
        DEC B  ; ROM $0D06: 05
        JP NZ,$0CF2  ; ROM $0D07: C2 F2 0C
        RET  ; ROM $0D0A: C9
NATIVE_0D0B:
        LD DE,$4000  ; ROM $0D0B: 11 00 40
        LD HL,$00E0  ; ROM $0D0E: 21 E0 00
NATIVE_0D11:
        LD B,H  ; ROM $0D11: 44
        LD C,H  ; ROM $0D12: 4C
        LD A,L  ; ROM $0D13: 7D
        LD HL,$0000  ; ROM $0D14: 21 00 00
        ADD HL,SP  ; ROM $0D17: 39
        EX DE,HL  ; ROM $0D18: EB
        DI  ; ROM $0D19: F3
        LD SP,HL  ; ROM $0D1A: F9
NATIVE_0D1B:
        PUSH BC  ; ROM $0D1B: C5
        PUSH BC  ; ROM $0D1C: C5
        PUSH BC  ; ROM $0D1D: C5
        PUSH BC  ; ROM $0D1E: C5
        PUSH BC  ; ROM $0D1F: C5
        PUSH BC  ; ROM $0D20: C5
        PUSH BC  ; ROM $0D21: C5
        PUSH BC  ; ROM $0D22: C5
        PUSH BC  ; ROM $0D23: C5
        PUSH BC  ; ROM $0D24: C5
        PUSH BC  ; ROM $0D25: C5
        PUSH BC  ; ROM $0D26: C5
        PUSH BC  ; ROM $0D27: C5
        PUSH BC  ; ROM $0D28: C5
        PUSH BC  ; ROM $0D29: C5
        PUSH BC  ; ROM $0D2A: C5
        DEC A  ; ROM $0D2B: 3D
        JP NZ,$0D1B  ; ROM $0D2C: C2 1B 0D
        EX DE,HL  ; ROM $0D2F: EB
        LD SP,HL  ; ROM $0D30: F9
        EI  ; ROM $0D31: FB
        RET  ; ROM $0D32: C9
NATIVE_0D33:
        RST $28  ; ROM $0D33: EF
NATIVE_0D34:
        PUSH HL  ; ROM $0D34: E5
        CALL $0C83  ; ROM $0D35: CD 83 0C
        POP DE  ; ROM $0D38: D1
NATIVE_0D39:
        LD B,$08  ; ROM $0D39: 06 08
        LD C,$20  ; ROM $0D3B: 0E 20
NATIVE_0D3D:
        LD A,(DE)  ; ROM $0D3D: 1A
        INC DE  ; ROM $0D3E: 13
        LD (HL),A  ; ROM $0D3F: 77
        LD A,B  ; ROM $0D40: 78
        LD B,$00  ; ROM $0D41: 06 00
        ADD HL,BC  ; ROM $0D43: 09
        DEC A  ; ROM $0D44: 3D
        LD B,A  ; ROM $0D45: 47
        JP NZ,$0D3D  ; ROM $0D46: C2 3D 0D
        RET  ; ROM $0D49: C9
        DB $06,$08,$0E,$20,$7E,$12,$13,$78,$06,$00,$09,$47 ; ROM $0D4A unclassified
        DB $05,$C2,$4E,$0D,$C9 ; ROM $0D56 unclassified
NATIVE_0D5B:
        LD A,($2006)  ; ROM $0D5B: 3A 06 20
        AND A  ; ROM $0D5E: A7
        RET Z  ; ROM $0D5F: C8
        LD HL,($2004)  ; ROM $0D60: 2A 04 20
        LD A,(HL)  ; ROM $0D63: 7E
        AND A  ; ROM $0D64: A7
        RET NZ  ; ROM $0D65: C0
        LD A,C  ; ROM $0D66: 79
        LD ($2003),A  ; ROM $0D67: 32 03 20
        LD A,B  ; ROM $0D6A: 78
        OUT ($01),A  ; ROM $0D6B: D3 01
        RET  ; ROM $0D6D: C9
        DB $3A,$06,$20,$A7,$C8 ; ROM $0D6E unclassified
NATIVE_0D73:
        LD HL,($2004)  ; ROM $0D73: 2A 04 20
        LD A,(HL)  ; ROM $0D76: 7E
        AND A  ; ROM $0D77: A7
NATIVE_0D78:
        EX DE,HL  ; ROM $0D78: EB
        LD ($2004),HL  ; ROM $0D79: 22 04 20
        RET  ; ROM $0D7C: C9
NATIVE_0D7D:
        LD ($21BE),A  ; ROM $0D7D: 32 BE 21
        PUSH BC  ; ROM $0D80: C5
        PUSH DE  ; ROM $0D81: D5
        PUSH HL  ; ROM $0D82: E5
NATIVE_0D83:
        CALL $0520  ; ROM $0D83: CD 20 05
        LD A,($21BE)  ; ROM $0D86: 3A BE 21
        AND A  ; ROM $0D89: A7
        JP NZ,$0D83  ; ROM $0D8A: C2 83 0D
        POP HL  ; ROM $0D8D: E1
        POP DE  ; ROM $0D8E: D1
        POP BC  ; ROM $0D8F: C1
        RET  ; ROM $0D90: C9
NATIVE_0D91:
        PUSH HL  ; ROM $0D91: E5
        PUSH BC  ; ROM $0D92: C5
        LD HL,$200A  ; ROM $0D93: 21 0A 20
        LD B,$08  ; ROM $0D96: 06 08
        LD A,(HL)  ; ROM $0D98: 7E
NATIVE_0D99:
        RLCA  ; ROM $0D99: 07
        RLCA  ; ROM $0D9A: 07
        RLCA  ; ROM $0D9B: 07
        XOR (HL)  ; ROM $0D9C: AE
        RLA  ; ROM $0D9D: 17
        RLA  ; ROM $0D9E: 17
        LD HL,$200A  ; ROM $0D9F: 21 0A 20
        LD A,(HL)  ; ROM $0DA2: 7E
        RLA  ; ROM $0DA3: 17
        LD (HL),A  ; ROM $0DA4: 77
        INC HL  ; ROM $0DA5: 23
        LD A,(HL)  ; ROM $0DA6: 7E
        RLA  ; ROM $0DA7: 17
        LD (HL),A  ; ROM $0DA8: 77
        INC HL  ; ROM $0DA9: 23
        LD A,(HL)  ; ROM $0DAA: 7E
        RLA  ; ROM $0DAB: 17
        LD (HL),A  ; ROM $0DAC: 77
        INC HL  ; ROM $0DAD: 23
        LD A,(HL)  ; ROM $0DAE: 7E
        RLA  ; ROM $0DAF: 17
        LD (HL),A  ; ROM $0DB0: 77
        DEC B  ; ROM $0DB1: 05
        JP NZ,$0D99  ; ROM $0DB2: C2 99 0D
        POP BC  ; ROM $0DB5: C1
        POP HL  ; ROM $0DB6: E1
        RET  ; ROM $0DB7: C9
NATIVE_0DB8:
        CALL $0DD4  ; ROM $0DB8: CD D4 0D
NATIVE_0DBB:
        LD A,(HL)  ; ROM $0DBB: 7E
        CALL $044C  ; ROM $0DBC: CD 4C 04
        LD A,(HL)  ; ROM $0DBF: 7E
        AND A  ; ROM $0DC0: A7
        INC HL  ; ROM $0DC1: 23
        JP P,$0DBB  ; ROM $0DC2: F2 BB 0D
        RET  ; ROM $0DC5: C9
NATIVE_0DC6:
        CALL $0DD4  ; ROM $0DC6: CD D4 0D
NATIVE_0DC9:
        LD A,(HL)  ; ROM $0DC9: 7E
        CALL $0400  ; ROM $0DCA: CD 00 04
        LD A,(HL)  ; ROM $0DCD: 7E
        AND A  ; ROM $0DCE: A7
        INC HL  ; ROM $0DCF: 23
        JP P,$0DC9  ; ROM $0DD0: F2 C9 0D
        RET  ; ROM $0DD3: C9
NATIVE_0DD4:
        LD HL,$0E1A  ; ROM $0DD4: 21 1A 0E
        LD A,D  ; ROM $0DD7: 7A
        CALL $0C9C  ; ROM $0DD8: CD 9C 0C
        PUSH HL  ; ROM $0DDB: E5
        LD HL,$0E4C  ; ROM $0DDC: 21 4C 0E
        CALL $0DE8  ; ROM $0DDF: CD E8 0D
        LD A,E  ; ROM $0DE2: 7B
        CALL $0C9C  ; ROM $0DE3: CD 9C 0C
        POP DE  ; ROM $0DE6: D1
        RET  ; ROM $0DE7: C9
NATIVE_0DE8:
        IN A,($02)  ; ROM $0DE8: DB 02
        RLCA  ; ROM $0DEA: 07
        RLCA  ; ROM $0DEB: 07
        RLCA  ; ROM $0DEC: 07
        AND $03  ; ROM $0DED: E6 03
        JP $0C9C  ; ROM $0DEF: C3 9C 0C
NATIVE_0DF2:
        LD B,$12  ; ROM $0DF2: 06 12
NATIVE_0DF4:
        LD A,$09  ; ROM $0DF4: 3E 09
NATIVE_0DF6:
        LD C,B  ; ROM $0DF6: 48
NATIVE_0DF7:
        OUT ($01),A  ; ROM $0DF7: D3 01
        PUSH AF  ; ROM $0DF9: F5
        PUSH BC  ; ROM $0DFA: C5
        CALL $0520  ; ROM $0DFB: CD 20 05
        POP BC  ; ROM $0DFE: C1
        POP AF  ; ROM $0DFF: F1
        DEC C  ; ROM $0E00: 0D
        JP NZ,$0DF7  ; ROM $0E01: C2 F7 0D
        ADD A,$10  ; ROM $0E04: C6 10
        JP NC,$0DF6  ; ROM $0E06: D2 F6 0D
        DEC B  ; ROM $0E09: 05
        JP NZ,$0DF4  ; ROM $0E0A: C2 F4 0D
        LD A,$0A  ; ROM $0E0D: 3E 0A
        OUT ($01),A  ; ROM $0E0F: D3 01
        RET  ; ROM $0E11: C9
        DB $01,$01,$01,$01,$02,$01,$02,$01,$00,$28,$40,$2A ; ROM $0E12 unclassified
        DB $00,$2E,$40,$34,$61,$3E,$6C,$0E,$7A,$0E,$8A,$0E ; ROM $0E1E unclassified
        DB $D5,$0E,$5E,$0E,$62,$0E,$62,$0E,$67,$0E,$F4,$0E ; ROM $0E2A unclassified
        DB $1B,$00,$FA,$0E,$23,$00,$28,$06,$00,$10,$03,$10 ; ROM $0E36 unclassified
        DB $06,$10,$9F,$08,$09,$10,$0C,$10,$0F,$10,$24,$0E ; ROM $0E42 unclassified
        DB $20,$10,$40,$10,$60,$10,$50,$4C,$41,$59,$45,$D2 ; ROM $0E4E unclassified
        DB $57,$49,$4E,$D3,$08,$54,$49,$C5,$08,$47,$41,$4D ; ROM $0E5A unclassified
        DB $C5,$08,$4F,$56,$45,$D2,$07,$54,$4F,$40,$53,$54 ; ROM $0E66 unclassified
        DB $41,$52,$54,$40,$47,$41,$4D,$C5,$08,$59,$4F,$55 ; ROM $0E72 unclassified
        DB $40,$48,$41,$56,$45,$40,$43,$52,$45,$44,$49,$D4 ; ROM $0E7E unclassified
        DB $03,$50,$52,$45,$53,$53,$40,$31,$40,$4F,$52,$40 ; ROM $0E8A unclassified
        DB $32,$40,$50,$4C,$41,$59,$45,$52,$40,$42,$55,$54 ; ROM $0E96 unclassified
        DB $54,$4F,$4E,$23,$25,$49,$4E,$53,$45,$52,$54,$40 ; ROM $0EA2 unclassified
        DB $41,$44,$44,$49,$54,$49,$4F,$4E,$41,$4C,$40,$43 ; ROM $0EAE unclassified
        DB $4F,$49,$4E,$25,$25,$46,$4F,$52,$40,$33,$40,$4F ; ROM $0EBA unclassified
        DB $52,$40,$34,$40,$50,$4C,$41,$59,$45,$52,$40,$47 ; ROM $0EC6 unclassified
        DB $41,$4D,$C5,$40,$50,$52,$45,$53,$53,$40,$31,$40 ; ROM $0ED2 unclassified
        DB $32,$40,$33,$40,$4F,$52,$40,$34,$40,$50,$4C,$41 ; ROM $0EDE unclassified
        DB $59,$45,$52,$40,$42,$55,$54,$54,$4F,$CE,$06,$43 ; ROM $0EEA unclassified
        DB $48,$45,$43,$CB,$04,$49,$4E,$53,$45,$52,$D4,$09 ; ROM $0EF6 unclassified
        DB $0F,$0C,$0F,$0F,$0F,$14,$0F,$4F,$4E,$C5,$54,$57 ; ROM $0F02 unclassified
        DB $CF,$54,$48,$52,$45,$C5,$46,$4F,$55,$D2,$20,$0F ; ROM $0F0E unclassified
        DB $2E,$0F,$3D,$0F,$47,$0F,$42,$49,$54,$45,$53,$40 ; ROM $0F1A unclassified
        DB $54,$48,$45,$40,$44,$55,$53,$D4,$4D,$45,$45,$54 ; ROM $0F26 unclassified
        DB $53,$40,$48,$49,$53,$40,$4D,$41,$4B,$45,$D2,$43 ; ROM $0F32 unclassified
        DB $48,$45,$43,$4B,$53,$40,$4F,$55,$D4,$50,$52,$4F ; ROM $0F3E unclassified
        DB $4E,$4F,$55,$4E,$43,$45,$44,$40,$44,$45,$41,$C4 ; ROM $0F4A unclassified
        DB $46,$03,$50,$03,$5A,$03,$64,$03,$FC,$01,$06,$02 ; ROM $0F56 unclassified
        DB $10,$02,$1A,$02,$B4,$04,$BC,$04,$C4,$04,$CC,$04 ; ROM $0F62 unclassified
        DB $76,$0F,$79,$0F,$7C,$0F,$7F,$0F,$3A,$3A,$DB,$3B ; ROM $0F6E unclassified
        DB $3B,$DC,$3C,$3C,$DD,$3D,$3D,$DE,$8A,$0F,$90,$0F ; ROM $0F7A unclassified
        DB $96,$0F,$9C,$0F,$5F,$60,$61,$3E,$62,$E3,$5F,$60 ; ROM $0F86 unclassified
        DB $61,$3E,$64,$E5,$5F,$60,$61,$66,$67,$E8,$5F,$60 ; ROM $0F92 unclassified
        DB $61,$3E,$69,$EA,$C0,$21,$C8,$21,$D0,$21,$D8,$21 ; ROM $0F9E unclassified
        DB $1E,$17,$01,$17,$15,$17,$0B,$17,$00,$FF,$00,$01 ; ROM $0FAA unclassified
        DB $FF,$00,$01,$00,$C8,$0F,$C8,$0F,$CC,$0F,$D2,$0F ; ROM $0FB6 unclassified
        DB $1B,$0B,$04,$0B,$0E,$04,$0F,$13,$00,$24,$18,$24 ; ROM $0FC2 unclassified
        DB $00,$24,$07,$24,$18,$24,$00,$24,$07,$24,$11,$24 ; ROM $0FCE unclassified
        DB $18,$24,$14,$09,$14,$19,$14,$29,$14,$39,$00,$F0 ; ROM $0FDA unclassified
        DB $00,$00,$14,$04,$05,$A9,$05,$19,$05,$79,$00,$32 ; ROM $0FE6 unclassified
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; ROM $0FF2 unclassified
        DB $00,$00 ; ROM $0FFE unclassified
