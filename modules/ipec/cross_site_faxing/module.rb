#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
class Cross_site_faxing < BeEF::Core::Command
  def self.options
    [
      { 'name' => 'ip', 'ui_label' => 'Target Address', 'value' => 'localhost' },
      { 'name' => 'port', 'ui_label' => 'Target Port', 'value' => '3000' },
      { 'name' => 'recname', 'ui_label' => 'Name of the receiver', 'value' => 'BeEF' },
      { 'name' => 'recfax', 'ui_label' => 'Fax number of the recipient', 'value' => '+1 11 112233-2' },
      { 'name' => 'subject', 'ui_label' => 'Subject', 'value' => 'Got some BeEF?' },
      { 'name' => 'msg', 'ui_label' => 'Message', 'description' => 'Message to print', 'type' => 'textarea', 'value' => "
**********************************************************************

                                     .O,
                                     lkOl
                                     od cOc
                                     'X,  cOo.
                                      cX,   ,dkc.
              BeEF                     ;Kd.    ,odo,.
                                        .dXl   .  .:xkl'
                                          'OKc  .;c'  ,oOk:
                                            ,kKo. .cOkc. .lOk:.
                                              .dXx.  :KWKo. 'dXd.
                                                .oXx.  cXWW0c..dXd.
                                                  oW0   .OWWWNd.'KK.
                                          ....,;lkNWx     KWWWWX:'XK.
 ,o:,                          .,:odkO00XNK0Okxdlc,.     .KWWWWWWddWd
  K::Ol                   .:d0NXK0OkxdoxO'             .lXWWWWWWWWKW0
  od  d0.              .l0NKOxdooooooox0.        .,cdOXWWWWWWWWWWWWWx
  :O   ;K;           ;kN0kooooooooooooK:  .':ok0NWWWWWWWWWWWWWWWWWWK.
  'X    .Kl        ;KNOdooooooooooooooXkkXWWWWWWWWWWWWWWWWWWWWWWWNd.
  .N. o. .Kl     'OW0doooooooooooooodkXWWWWWWWWWWWWWWWWWWWWWWWW0l.
   0l oK' .kO:';kNNkoooooooooooook0XWWWWWWWWWWWWWWWWWWWWWWWKx:.
   lX.,WN:  .:c:xWkoooooooooood0NWW0OWWWWWWWWWWWWWWWWWWWKo.
    0O.0WWk'   .XKoooooooooooONWWNo  dWWWWWWWWWWWWWWWWWl
     oKkNWWWX00NWXdooooooooxXWWNk'   dWWWWWWWWWWWWWWWWX
      .cONWWWWWWWWOoooooooONWWK:...c0WWWWWWWWWWWWWWWWWW:
         .;oONWWWWxooooodKWWWWWWWWWWWWWWWWWWWWWWWWWWWWWX.
              'XW0oooookNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWd
              oW0ooooo0WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWO
             ;NXdooodKWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWx
          ;xkOOdooooxOO0KNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWX.
         .NOoddxkkkkxxdoookKWWWWWWWWWWWWWWWWWWWWWWWWWWX'
          :KNWWWWWWWWWWX0xooONWWWWWWWWWWWWWWWWWWWWWWWk.
         .xNXxKWWWWWWWOXWWXxoKWWWWWWWWWWWWWWWWWWWWNk'
         OWl cNWWWWWWWk oNWNxKWWWWWWWWWWWWWWWWWNOl.
        ,Wk  xWWWWWWWWd  xWWNWWWWWWWWWWWWXOdc,.
        .N0   lOXNX0x;  .KWWWWWWWWWWWNkc.
         :NO,         'lXWWWWWWWWWNk:.
          .dXN0OkxkO0NWWWWWWWWWWKl.
             .';o0WWWWWWWWWWWNk;
                  .cxOKXKKOd;.

**********************************************************************",
        'width' => '200px' }
    ]
  end

  def post_execute
    save({ 'result' => @datastore['result'] })
  end
end
