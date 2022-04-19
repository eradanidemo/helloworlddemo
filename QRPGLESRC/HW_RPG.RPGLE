     D SendEscMsg      pr                  extpgm('QMHSNDPM')
     D   MsgID                        7    const
     D   MsgFile                     20    const
     D   MsgDta                      80    const
     D   MsgDtaLen                   10i 0 const
     D   MsgType                     10    const
     D   MsgQ                        10    const
     D   MsgQNbr                     10i 0 const
     D   MsgKey                       4
     D   ErrorDS                     16

     D ErrorDS         ds            16
     D   BytesProv                   10i 0 inz(0)
     D   BytesAvail                  10i 0
     D   ExceptionID                  7

     D MsgDta          s             80
     D MsgKey          s              4

     C                   eval      MsgDta = 'Something went wrong'
     C                   callp     SendEscMsg ('HWD0003':
     C                               'HWMSGS    *LIBL':
     C                               MsgDta:
     C                               %len(MsgDta):
     C                               '*DIAG':
     C                               '*PGMBDY':
     C                               3:
     C                               MsgKey:
     C                               ErrorDS)
     C                   eval      *inlr = *on
