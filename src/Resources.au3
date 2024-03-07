#include-once

Func Base64_Decode($sImageData)
    Local $aCall = DllCall('crypt32.dll', 'bool', 'CryptStringToBinaryW', 'wstr', $sImageData, 'dword', 0, 'dword', 0x01, 'ptr', Null, 'dword*', Null, 'dword*', 0, 'dword*', 0)
    If Not $aCall[0] Then Return SetError(1, 0, '')
    Local $tBuffer = DllStructCreate('byte Data[' & $aCall[5] & ']')
    $aCall = DllCall('crypt32.dll', 'bool', 'CryptStringToBinaryW', 'wstr', $sImageData, 'dword', 0, 'dword', 0x01, 'ptr', DllStructGetPtr($tBuffer), 'dword*', $aCall[5], 'dword*', 0, 'dword*', 0)
    If Not $aCall[0] Then Return SetError(2, 0, '')
    Return $tBuffer.Data
EndFunc

Func FlipImage($dImage, $iFlip)
    Local $hBitmap = _GDIPlus_BitmapCreateFromMemory($dImage)
    _GDIPlus_ImageRotateFlip($hBitmap, $iFlip)
    Local $tEncoder = _WinAPI_GUIDFromString(_GDIPlus_EncodersGetCLSID('png'))
    Local $pStream = _WinAPI_CreateStreamOnHGlobal()
    _GDIPlus_ImageSaveToStream($hBitmap, $pStream, $tEncoder, 0)
    _GDIPlus_BitmapDispose($hBitmap)
    Local $hMemory = _WinAPI_GetHGlobalFromStream($pStream)
    Local $iSize = _MemGlobalSize($hMemory)
    Local $pLock = _MemGlobalLock($hMemory)
    Local $tBytes = DllStructCreate('byte Data[' & $iSize & ']', $pLock)
    Local $dData = $tBytes.Data
    _MemGlobalUnlock($hMemory)
    _MemGlobalFree($hMemory)
    _WinAPI_ReleaseStream($pStream)
    Return $dData
EndFunc

Func EPUB_Icon()
    Local $sData
    $sData &= 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAGlElEQVRYhbWX'
	$sData &= 'C4xcVRnHf+fcx9x5bHd2uu227m53221DVVbYsBSLjTENUEyAAGkxUSoaYmgQ'
	$sData &= 'hTQqMZbQSiMVgq8StWJNyLaAEVBKFbcYBaEUirg2wEYo9EGfy+623ZndedzH'
	$sData &= 'OebO7N663Ue7WP/JzNy5c875/vf7/t9jBJPAMCya5y+6xrRiDyoVzAV8QE20'
	$sData &= 'I1vQRl21SPzxW6m1DRmx7mRB4wcWputR4wi4fgcYbnmtGLZsjmxOJGaOOsz3'
	$sData &= 'XaozM2+2YvEOFfgjt2OTEa5AoLVeWyYquO9sqyMCsxsvHHOQZRvrVOCGB57d'
	$sData &= '7mmEhiWI7wutbdD3nBMByw7OJPBxpYJ5UzQ+AqVBCs0aAb7Wel3k84kI+HrM'
	$sData &= 'gpj4aMYjhLuFVGtNA5fAup+xNkJXTbr/f4aBIhD2D4qW/73QL+Gh2o+e+7QH'
	$sData &= 'zgdCh0mJNg3BKOeZPnkdrC/++XNCaLGesiM6zz8BQ0K+oIWIoeUsSXpgmEVo'
	$sData &= 'UJngxu8D4SL0A/8XD6QcwYdZLTc8WfJvW2rpgYIWwaiq4YVcfqhhEPj5CLcK'
	$sData &= 'MktAGNTXCqoc8AMuEkr/ayoERoR+9KTWtgm2yUQ6fr5n/9+vCi8iD/zsK9M4'
	$sData &= 'MVRkY2dAtgANNQJ/wpo3PkJjIYdZaSE8v1IyJyi1Ea2IwDeWpyChuHKh4IqH'
	$sData &= '8uzvVcybLvDOLA9nIzFs1D7H4EbLeo/4JKyAyy93eMFJ8vkNQ6r73QCSk7aL'
	$sData &= 'yaHAMKFxusSxIBjHoxEBrcxwfUP2oPrqoosMb/vdieZnX/NIJyuh+FhakKmq'
	$sData &= 'pFfJgwO9irkzJYNFHQqPC2ZLDvYppsUFmZRADvN+bo/P1p0eVXFIxUS5RI5L'
	$sData &= 'wE7m5gYFp1tL5Zw8pFi0wGBxmwlhCFKCrn/4dL7uhR2Pm5fa3HSTw9bHirS2'
	$sData &= 'mLS3Gvzm6RJfXhbj4DHF9lc9PF+z8gqba5c7tP2qwF1bCzjWaWIjiCqh1N7d'
	$sData &= 'aMKmGSYDxUHN0HHFwHEFg5oNTxX57qMF/tLt0/btHLv/5vKdJwo80lnC69Xc'
	$sData &= '+tM8b73jc/+TRe79fZGn3/BZsCrLOzs9vvZFh8vmm/TnxqZEREAV4s2KANOE'
	$sData &= 'dJ0kmRQkU4LqmbKsrCCAqz9js/uRamalJc/+0+PiJoMZw2GZMVtimwLP1ay+'
	$sData &= 'IcabHdPKctzR5RE+1oxqQcmbhABSEbMFqZRk0zMlFtyZ44K7cmzZ4UJallWt'
	$sData &= 'hQYrHFRgoj5l2oKhAc2+Lp90WrCw0YCcxvfDxjR2/ahbyYzkwT8UWbUxz8ol'
	$sData &= 'NssvtVj50BDbtpVon2/Q9V7A0tuy7O9RXNVqknfHHthSJ9n8okvLqiwXzzG4'
	$sData &= 'MtRRbuKCEhGI24LiScXDnS6tC01uvNRkxactqtOCe7cU6AufQkEiJnhqdYLP'
	$sData &= 'tlkc7h978LFTmqWfMHlmTZK3jwT89iUPqiduulEWmAaiL0t5+kknJJv+6jJU'
	$sData &= 'gtuXxWjISDr3eLS3GGz/SRUUNG5PQN7VxB2BPa2SXn6gyeUUcxsNrvtmkuTj'
	$sData &= 'RXZ2+3zhhthE88hpD+QLMqibJZhTK3n7cMDGW+KsXxFj73FF+7ywRxj0ZzX0'
	$sData &= 'BLgfqrLgQhmE4Th0SJV/C9NMWIK+XkXfc0UOHFFUVwmwRUU340QiIqCdodcp'
	$sData &= 'GXTckSgXEvuWAeavzrF7n88n6yVBoAjKgxao8DMluOd6h80vuMy5I8t17RaX'
	$sData &= 'fMokYcPvXvNovHOQ1ibJmhUO9CveO6rK3fJMRHdObLtG6oJ+OZMRi4eK8Ma7'
	$sData &= 'PpaAxYtsSMCRt3w8oLleVoqTHC5QXT4f9CiuXmITS8HxfYpjp1S5DLddGLZE'
	$sData &= '+PqP8mx+yaWpVo5kz4693S8uG6UBrxhX8VhuST5rX5Zs0W5pL5c89oq3afPL'
	$sData &= 'HqeGFA0ZI9QJh0+o8uAR1vUwNeszEseEP/0yT/+gor5GUuVUNPHoKy679gbs'
	$sData &= '+UDRmBlfiP8lQp9kXCpZbe76xdYct/+6GM7j2PaIk/xxD5gMIcmwNzTVVs4Y'
	$sData &= 'r3ZEBDIZo/ztxx0FVj9epG66lDXO+B1sqphsuI4I3Ppwlp6sx/NvKhpqTVIO'
	$sData &= 'IpjqRHLuiOIREeh4NexWkubZAkNqVCCKFY2el+l8FISkMIZAc00lxtqLov1v'
	$sData &= 'w0i8r5Rq0eMl8Ec1LgTKD3aNfDdGLhwnjVdyo5dbLBKo4IRtxm6caLCbuvHy'
	$sData &= '+/ulIeNLAwMHyk8VeeDooe7Rq7XCMO0tTS3tp0wr9gBazzvb3/NJYCGEUkpt'
	$sData &= '91y9ypBGWFIA+A/R9ryYbBp64QAAAABJRU5ErkJggg=='
    Return Base64_Decode($sData)
EndFunc

Func Back_Icon($fFlip = False)
    Local $sData
	$sData &= 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAAn'
	$sData &= 'AAAAJwEqCZFPAAAE7mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFj'
	$sData &= 'a2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQi'
	$sData &= 'Pz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0'
	$sData &= 'az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZWRhMmIzZiwgMjAyMS8x'
	$sData &= 'MS8xNC0xMjozMDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo'
	$sData &= 'dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4g'
	$sData &= 'PHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRw'
	$sData &= 'Oi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1'
	$sData &= 'cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0'
	$sData &= 'cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wTU09'
	$sData &= 'Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0'
	$sData &= 'PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VF'
	$sData &= 'dmVudCMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIzLjEg'
	$sData &= 'KFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wMy0wNVQxNTozMjow'
	$sData &= 'OCswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDMtMDVUMTU6NTQ6Mzkr'
	$sData &= 'MDI6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQtMDMtMDVUMTU6NTQ6Mzkr'
	$sData &= 'MDI6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JN'
	$sData &= 'b2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjVhNzU3MTU1LWE4'
	$sData &= 'MTYtOGQ0Mi1hZTQ1LTcxZjA3NmM4ZGE3ZSIgeG1wTU06RG9jdW1lbnRJRD0i'
	$sData &= 'eG1wLmRpZDo1YTc1NzE1NS1hODE2LThkNDItYWU0NS03MWYwNzZjOGRhN2Ui'
	$sData &= 'IHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1YTc1NzE1NS1h'
	$sData &= 'ODE2LThkNDItYWU0NS03MWYwNzZjOGRhN2UiPiA8eG1wTU06SGlzdG9yeT4g'
	$sData &= 'PHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2'
	$sData &= 'dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjVhNzU3MTU1LWE4MTYtOGQ0Mi1hZTQ1'
	$sData &= 'LTcxZjA3NmM4ZGE3ZSIgc3RFdnQ6d2hlbj0iMjAyNC0wMy0wNVQxNTozMjow'
	$sData &= 'OCswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9w'
	$sData &= 'IDIzLjEgKFdpbmRvd3MpIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5'
	$sData &= 'PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4g'
	$sData &= 'PD94cGFja2V0IGVuZD0iciI/PiBtCv8AAARUSURBVFjDzVdfbFNVGP+IgFsi'
	$sData &= 'JEaWCEUrA1l7z7m33QiMGBNnoL1/2oKwECFsiTFBJUrii28++EomJGpiwkQ3'
	$sData &= '1sVJR++953ZDScQHfFhiZmQIRrRKFsP0daGUB8mO3zldY1fsum4d8yRf0j/3'
	$sData &= 'nO93z/f7/vwAOEDRGvJrIOopYDoq6BcpRB0NjDSFfekAGJ7WZDDabbpqr+Gq'
	$sData &= 'Y4ZLJ9GmZ23ScuiY5ZBPDEa6TSfUlEgrYDHcz8JgOCEwPTwvo0DDvTVQ6hOq'
	$sData &= 'ArAptRzlLDrPoSNeyfRZm/2eE3ssFqaLA+AigFGK6GlP4WCVz+e8EiBD7lN7'
	$sData &= 'DCdcCwAibqAZD5mo1el/G+Gmq10zGW2OjlQBIAzfOpRIhe4YTj2c/2vyTI9o'
	$sData &= '5f5gW3ZTwX7zQctPG32I+J6V1uZsjrEw331+I39++Gn8HFoUAHGm7ir54PVN'
	$sData &= 'vpafn4KiwbEzrfAa2rHeNjiU3JnVGcaPkTmbI3aAv375JQmkZWAt1x3CkeG1'
	$sData &= 'cUKeqfBDA+3ZI5/qcOSziDSIYarEWQhiTvC04ZBZ4pSSifBgsoFfuX2J/5n7'
	$sData &= 'gx//5iB/9txqHv78cQQRwvjWRlATgURscrpjKAQvooExiqk2ovkNplZgM5Fv'
	$sData &= 'bWcHeHGN3krxAyO7+JY+4M+lNsubWTAAPE/yy97hN5ydCABTznTpYOV0KtxA'
	$sData &= 'OnuOl677M/f5mR9PIi/8fGv/Kr7H3r5gfkgQGZoUL49pp67HH2dqBVBct3OT'
	$sData &= '/N2xN7g6+Bg+11gg3ML4MYMFah2mndJtzBPHagCK67u/rvBXv7bkbewY2iBv'
	$sData &= 'oyo/GOmCmK3062zpAIrLxueEc8EPEZ5K/IjiLcXtQB/Gn4zPX1JrAyBW/u+7'
	$sData &= '/IOr78nasa3/Eb4X09h6gB8YJhYcB8zPKdNV6wqguH6fvsnf+fYVyQ0RloTX'
	$sData &= 'VlYb1CkQnaveN1C+bk3/IuvHrvNPlp+f+18AmFouAPOHgBRCgJPMuKj/K0JC'
	$sData &= 'F0m4UmmoyzQM9uGsR1asEJmiEBle63ocQh5+KWbqjOm1rgPriyBgf0/qnvrQ'
	$sData &= 'mpEI+YEUSR4eDAJ0JjU4OKT6TVb4Y9nbMbbiSIbyvV9qfl10w87hVuhMtYn5'
	$sData &= '/VTE0/ABUnEgmVryQKJy01awFbec6riswAto8Ob7zXCiZyu8fXILHO1Ts5FM'
	$sData &= 'iJenZb1GsijaywPtvx7/eDec+LAd3vqoHSD8QyNaA7R93wj06hM+vIV8LK0u'
	$sData &= 'z1DKlDy9ttlHrz8D5IZfWtlYvgqiLtH24wht1nEsFyIlngrfwf7/4Fhe+uXR'
	$sData &= 'u2shyqhQMc26RyeWCkKqKgynZZOJmI3CJENQmKyuAsBFCTVKoONSEBWS1iNk'
	$sData &= 'mb5IAPIFUN7tHw5AHMVqZGSBAHR8sOOrAIrTMFiuRuaIU1aZ4SWOc5hqZxN2'
	$sData &= 'gCTSBPZdEADI4gDEUSkLeY7SewM2kC7TJr3I6DEEMkeeG/I3lOeu2hW/QJr2'
	$sData &= 'XFRQa2yHagD+AbcTsOg9IdsYAAAAAElFTkSuQmCC'
    If $fFlip Then Return FlipImage(Base64_Decode($sData), 2)
    Return Base64_Decode($sData)
EndFunc

Func Home_Icon()
    Local $sData
	$sData &= 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAA7E'
	$sData &= 'AAAOxAGVKw4bAAAE7mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFj'
	$sData &= 'a2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQi'
	$sData &= 'Pz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0'
	$sData &= 'az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZWRhMmIzZiwgMjAyMS8x'
	$sData &= 'MS8xNC0xMjozMDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo'
	$sData &= 'dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4g'
	$sData &= 'PHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRw'
	$sData &= 'Oi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1'
	$sData &= 'cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0'
	$sData &= 'cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wTU09'
	$sData &= 'Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0'
	$sData &= 'PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VF'
	$sData &= 'dmVudCMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIzLjEg'
	$sData &= 'KFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wMy0wNVQxNToyOTo0'
	$sData &= 'NiswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDMtMDVUMTY6MjQ6MTMr'
	$sData &= 'MDI6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQtMDMtMDVUMTY6MjQ6MTMr'
	$sData &= 'MDI6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JN'
	$sData &= 'b2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOmVlNDI1ZTBkLWE5'
	$sData &= 'ZDUtMjY0MC1hMWQ2LTA0Nzg4NjVmZGVjZiIgeG1wTU06RG9jdW1lbnRJRD0i'
	$sData &= 'eG1wLmRpZDplZTQyNWUwZC1hOWQ1LTI2NDAtYTFkNi0wNDc4ODY1ZmRlY2Yi'
	$sData &= 'IHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDplZTQyNWUwZC1h'
	$sData &= 'OWQ1LTI2NDAtYTFkNi0wNDc4ODY1ZmRlY2YiPiA8eG1wTU06SGlzdG9yeT4g'
	$sData &= 'PHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2'
	$sData &= 'dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmVlNDI1ZTBkLWE5ZDUtMjY0MC1hMWQ2'
	$sData &= 'LTA0Nzg4NjVmZGVjZiIgc3RFdnQ6d2hlbj0iMjAyNC0wMy0wNVQxNToyOTo0'
	$sData &= 'NiswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9w'
	$sData &= 'IDIzLjEgKFdpbmRvd3MpIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5'
	$sData &= 'PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4g'
	$sData &= 'PD94cGFja2V0IGVuZD0iciI/PlZfG6wAAAZ6SURBVFgJrcFbjJ1VGcfh3/uu'
	$sData &= '9e3DzJ7Z7bQdaBEKlAYJhZo0MRgiGNFABMRDjMRokEPirXJIvOCSOw5ivMMA'
	$sData &= 'BoNBgyYQAYmgAtHUBBJ6IDFCawsOQg/TOe2Z2fv71vo7ewp0LDNTVJ7HkHif'
	$sData &= 'zYgNDx8jJKjqGfWcoIhJ5JA2WMpXyrgM7CJDm4A1HDch7G1Dew29mM1+R2WH'
	$sData &= 'VRh9XkFuQuiJkYkRXIaMRZFTytuw9H3Luh5j0OgTJxk2dBZwibBbTHQwHpNx'
	$sData &= 'v8ReVuEsx1hgOLobqj0i3wwM8tEN4rrZc97jWXdjgLEsZxmWda532WXS7Swy'
	$sData &= '/icCI9+OaReZc1mGs4RaBtJ2umkX0sV8LAzQxZTVLrJdHDAiEIEIxMFXOywy'
	$sData &= '4R3OsMTOHK2BcWoCjI/EZC152tmJ5VbvFmNyFsXaE/P0mRmNXL6gtjdyYSCW'
	$sData &= 'JQPPIkwk0rpwdbJAnElPqQAVBmJZhmGWm5ODU3/qhdpWU0aAx2ZBbBQUTd2b'
	$sData &= '1/iW7AZiRV6JHJyZSwe/VK2NT5N4urcpXqUCSGI1yk5h6bz6YPdehsGHhXsD'
	$sData &= 'vMlmK3SrMBCrir1Ep928dvqC1jM+mYmTiakrW88e+/zINfGYALEaZSckbrXg'
	$sData &= 'm1Mt4lIPcvcuGacmyPXw1cZ077frHxuPYSa9Q037289M09hXPqWh8BVOxcBy'
	$sData &= 'pl6Vd9UtYxt+cmTYK00AxkoCxCMVyL+RRuLjTgq54s1c80Ei9TCVDprZJ3PD'
	$sData &= '8fH0NUO/Tm1H0SCzLBMyD20vynSdwFiBSTAjJr44fP2hm0Yenx9tms+kf8lt'
	$sData &= 'lII1cxsHm6lRnG+kN+YbBePXtH8z++nGN3M0rBQrkWGW83VeKVzhxopcIqfw'
	$sData &= '7c7ZA79MpztxtjvmR/OG2uFqQ5isUIiYhY3KbLEq/608P3Ls6vav5jcOfCtO'
	$sData &= 'V6zEgApdYaM/PvKyJ+2QcYIBGSwJd25IhT/CrCg61Zvd0eLMue2NdZ4YJ2c4'
	$sData &= 'VGPg4BxYeYahf/q8XuudVtuWo1M/2v1OKuwRzDiZCXKwV6JJm2R8iGehzM2p'
	$sData &= 'qD1CTljM+3GdOTvYHO18dmCcRWL48R4gcMZkdlaOvFk73H01t8Knqlr4eZyo'
	$sData &= 'omU9VK2LLBKLZGBZmyJimJPEoxXHPtP+3uyVjYcaL8H63x/9ezWic8xto3d1'
	$sData &= 'mPc09vXoXQBTX19LmEpY4i2fzWe3n5w+0Dg4/8rEF0Z2VNviw7UDZRx6ofMA'
	$sData &= 'NSE3lhiOLEM1/4HP6YHG6yXNd+f2YtVW6/onwnx+J0ejb+ivHVrPd9CAMckQ'
	$sData &= 'cxc2WDQSDo6fvvacja8f/kdjsrtztuuXlCO1n6ah3mCY7f4IN5aKiCmcQcQH'
	$sData &= 'yna0gbfmT6+/3PtF2QwXvvvd9Zs1xJgnUTYi7T/M0X5minJdxGZh/cPjTF7b'
	$sData &= 'YuryYfpSZQdYU9sysL+zb+DV+SergXBjWhtM0fmAAZkpG73/yMsu7RAfkiwr'
	$sData &= 'ZAs3drfWfkYdshu1Tqa1p0evIXIEBJYz3i3pbW4iC9i4KOYqFHWTsAcRXaCO'
	$sData &= '8QFLQg1/JVqNvZplB4H/JIKCYaY8uHsWEguM4E7VcmQJMiBQNFItUDswj5UB'
	$sData &= 'WlDVApatpM+oczKBgu2J3uW5HLiBkxkg+uqpFehzjIwjBGIUGKZPTIEdSm3H'
	$sData &= 'kkMyLNPXYCURcs+ejznZE+5SdgyxKkkkJRaY4C/AFgyQ7SOFrSAJw4zVGZBN'
	$sData &= 'RaknPDfDdDZ71KoMxqqEEEKIBaOcMIowsoFYnYFVmRzs0bLl095t1ukONe9U'
	$sData &= 'LUASyzJAAoklJjhhgj7j1JJQdHoDzTt7RR2PtTlsYP6gQr7PWIZxCAkkjhML'
	$sData &= 'BJScUAIZBAgh3nOIpQSOoKn7vNU7GJtdYvGSgUBF/bbQLr+cR/N5GQNxnHQ5'
	$sData &= '0gGOM0DIWhgjII6zEdClwAxggIQw7HKWcGVm6/7G/FBxm5UZDGzoj6LPMgvK'
	$sData &= 'Mxp7J173kqaC8fESQczlas3WUsWYOC5Of44lirHa3nBJ7JV/To3QwvjYZNOM'
	$sData &= 'KV56WqcYKzIkY5GzhHWESbuTh+0KttsQ/xcBYoHtxsJ2mXaXLroOPYeeg3MS'
	$sData &= 'EySz/XnAtkt+DwIk/luWBQ4K3EO27WTbzzKcZRhgJlL2O0riNqI9aKJDnwDx'
	$sData &= 'YQLE+zo5+oOp8G2KdgcSK4msRGCI7PaainCLlfohpqsIXCa4yLI2AWvoMybk'
	$sData &= '9jbGHk+8qMyzVd0PuwmyAGMl/wZ99zNs/ccq7gAAAABJRU5ErkJggg=='
    Return Base64_Decode($sData)
EndFunc

Func Stop_Icon()
    Local $sData
    $sData &= 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAA7E'
	$sData &= 'AAAOxAGVKw4bAAAE7mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFj'
	$sData &= 'a2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQi'
	$sData &= 'Pz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0'
	$sData &= 'az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZWRhMmIzZiwgMjAyMS8x'
	$sData &= 'MS8xNC0xMjozMDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo'
	$sData &= 'dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4g'
	$sData &= 'PHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRw'
	$sData &= 'Oi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1'
	$sData &= 'cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0'
	$sData &= 'cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wTU09'
	$sData &= 'Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0'
	$sData &= 'PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VF'
	$sData &= 'dmVudCMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIzLjEg'
	$sData &= 'KFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wMy0wNVQxNTozMjo0'
	$sData &= 'MiswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDMtMDVUMTY6MjQ6NTMr'
	$sData &= 'MDI6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQtMDMtMDVUMTY6MjQ6NTMr'
	$sData &= 'MDI6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JN'
	$sData &= 'b2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjk0Y2U0NDNlLTVi'
	$sData &= 'MTAtZjY0ZC1iNzgxLTg4MTAyYTRmOWM0MiIgeG1wTU06RG9jdW1lbnRJRD0i'
	$sData &= 'eG1wLmRpZDo5NGNlNDQzZS01YjEwLWY2NGQtYjc4MS04ODEwMmE0ZjljNDIi'
	$sData &= 'IHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5NGNlNDQzZS01'
	$sData &= 'YjEwLWY2NGQtYjc4MS04ODEwMmE0ZjljNDIiPiA8eG1wTU06SGlzdG9yeT4g'
	$sData &= 'PHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2'
	$sData &= 'dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjk0Y2U0NDNlLTViMTAtZjY0ZC1iNzgx'
	$sData &= 'LTg4MTAyYTRmOWM0MiIgc3RFdnQ6d2hlbj0iMjAyNC0wMy0wNVQxNTozMjo0'
	$sData &= 'MiswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9w'
	$sData &= 'IDIzLjEgKFdpbmRvd3MpIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5'
	$sData &= 'PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4g'
	$sData &= 'PD94cGFja2V0IGVuZD0iciI/PvcAAm0AAAPgSURBVFjDxVfNbxNXEJ8iofAh'
	$sData &= 'oQbBxiFehxRIbK+9H469iVClkDuQnrhwhkP7R9BrJaQiKOLjAgKpUnvstVKF'
	$sData &= 'uLRqpQpV6gmKRD+VeN9bOxtnwXHy+M3aqaLiXaeRLR9+fk/yvpnfzJuZN0OK'
	$sData &= 'iHZi9eRJEuUy+aZJfjZLslBo7237kHCcS9K2bwjL+hZ4DvhADfgN+E6Y5hdY'
	$sData &= 'L/uG8b7E2Srk1GybZKlEEvutVIr+q48SCczMkCwWpyD0FhQvY1WJsO0I0jR9'
	$sData &= 'USze92Zns3siIGdnIwLSMK5B8GYkuJfyLkR4Ly3rM5YnK5XdEQgmJwnMx3Hw'
	$sData &= 'e+//Ko6B5zjP/HL5lNK03gTWpqZOLc/NVfuh+F8CjEolaKbT1jsEWmDF2Dx+'
	$sData &= 'nJqadhRWCwSb6ieBjhdU1XHCUNP01ugobYMCBBpjFdHuzc//ErndNPtOgGVW'
	$sData &= 'WbbrvgwWFqi+uBiBwokJCnWd6qdPf1odgOXdrgNZcbOOwOQMId+yGBoCr/sh'
	$sData &= 'JsUeyWSUSKex6snQ8Y2OtVBQ3a4yigfI28jlPlCGgbQ7e5bT7o4X5/ZisZ1S'
	$sData &= 'CwtKLC4qce5cD3S+KZXaZ7vIrEJXvVz+KpyfJ2oUiyNIudCLcxtbxcr/WlYi'
	$sData &= 'bCqxIpMRhEr4a0qcv6DE+HhsnYgMNoxRgqsuJd4bu5QtDzeUUEqJVg+oDpY+'
	$sData &= 'UiKlJQaldJyrXOtvJ6Yde4BdytaxAj9IxuuWEmtvlLhwER5IxQcjvIDYe0x+'
	$sData &= 'ofDEGwKBTpn+iWD9q8S8HyAB4E/CT5D40WAJ1JnA2hAJrPIV/DG0K7DtvzkI'
	$sData &= 'nw4xCH/mpuPuUAhwGprml4RyeXlXhYgrHBcYVpAE/mYLuMiFaKxXIfqEGqXS'
	$sData &= 'YfR7zdi3gAmwB9g6Fs7WJYGVN5nAUiIBr30FGtUdh/BwPIxtv/hV44eFazuX'
	$sData &= 'V3ZtEpaW2srLZZw1uj9GQM1xvlmHbgqmpynIZnWPlcQ9x/yq8cMyNta+1ySw'
	$sData &= '1QxWHiOTrd/I53Mql0NDcuwYrQO16enrK5XKYLqhHfceebpSeVCfm6MaOuWo'
	$sData &= 'G4qQyRCC4kWVG5MBtWTc9MDT/9R0fZ+fTpMPvaRGRtrYv5+aR45MgEDoDaIp'
	$sData &= 'heUriItGKjXTPHCANgBeu7Xl9orrNvqt3HPdzdeTkx/2nAvWMZhI1z2D4Pu1'
	$sData &= 'b4OJZb1EI2rtajBpYDSroVdDbXhP5POf7xyz9gLE1T3MigeR87R14sTuCPgg'
	$sData &= 'gMMkkaIgYmH/GAh7EfG250LLakHh1zKfd33kuuQ5c08EeDxnAWifUQtSEHIF'
	$sData &= 'eID/fgBedUZzxu/Aj1D0CPgYA0iGFfrb5xMIvAV6VhDJ6lQwZAAAAABJRU5E'
	$sData &= 'rkJggg=='
    Return Base64_Decode($sData)
EndFunc

Func Refresh_Icon()
    Local $sData
	$sData &= 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAA3X'
	$sData &= 'AAAN1wFCKJt4AAAE7mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFj'
	$sData &= 'a2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQi'
	$sData &= 'Pz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0'
	$sData &= 'az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZWRhMmIzZiwgMjAyMS8x'
	$sData &= 'MS8xNC0xMjozMDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo'
	$sData &= 'dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4g'
	$sData &= 'PHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRw'
	$sData &= 'Oi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1'
	$sData &= 'cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0'
	$sData &= 'cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wTU09'
	$sData &= 'Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0'
	$sData &= 'PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VF'
	$sData &= 'dmVudCMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIzLjEg'
	$sData &= 'KFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wMy0wNVQxNTozMzoy'
	$sData &= 'MyswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDMtMDVUMTY6MjU6MDQr'
	$sData &= 'MDI6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQtMDMtMDVUMTY6MjU6MDQr'
	$sData &= 'MDI6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JN'
	$sData &= 'b2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOmI0NmEwN2Y0LTI2'
	$sData &= 'NWYtMTM0MC1iM2YyLTQ5MTRkNGY3MjIxMyIgeG1wTU06RG9jdW1lbnRJRD0i'
	$sData &= 'eG1wLmRpZDpiNDZhMDdmNC0yNjVmLTEzNDAtYjNmMi00OTE0ZDRmNzIyMTMi'
	$sData &= 'IHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpiNDZhMDdmNC0y'
	$sData &= 'NjVmLTEzNDAtYjNmMi00OTE0ZDRmNzIyMTMiPiA8eG1wTU06SGlzdG9yeT4g'
	$sData &= 'PHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2'
	$sData &= 'dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmI0NmEwN2Y0LTI2NWYtMTM0MC1iM2Yy'
	$sData &= 'LTQ5MTRkNGY3MjIxMyIgc3RFdnQ6d2hlbj0iMjAyNC0wMy0wNVQxNTozMzoy'
	$sData &= 'MyswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9w'
	$sData &= 'IDIzLjEgKFdpbmRvd3MpIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5'
	$sData &= 'PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4g'
	$sData &= 'PD94cGFja2V0IGVuZD0iciI/PlD5GKwAAAokSURBVFjDnVcHcBXXFV1nJpPQ'
	$sData &= 'mwCBDNgCBJgWugAhCSQECElIQxNG2AiDIJSxKWaMBwMJCaBgLEpwAQEBQu9g'
	$sData &= 'x2DqEFElioyq1VD7+r3tr/v//pP73v6vwRh7Yq/m6W95e89599177l1Bb7UI'
	$sData &= 'Lw+dxcyHlg2zSVCbjILKaAii3zR6vsfqdNx1y95qGTCz4ZblanaPPWNz/HP5'
	$sData &= 'u1q/LTZehSX8EgE1GWgwGvrqLKZsl9cj4qXDLUl8vHywuewd9i6z8ZsIsBVo'
	$sData &= 'zKatbq+30XBBSQmOnDmDv2Vl4YN165CxahUWrFiBZWvWYH1mJv517BjyCwsa'
	$sData &= '50uyF8wGs/WrCKiNhlCjaM0PGLpx5w6Wr1+PCampiEhMRGRyMiKnTEFEQgJG'
	$sData &= 'xccjfOJEDI8dj0FR0RhN5ws/WI4r1683EmG2mM3/i4DGZBxgsdu5uw0mE9Zs'
	$sData &= '+jtGE2jMtGmcwBgCnjBzJlIzMjDv/feRvmwZps6diygiMygqCiPHx2EIEekz'
	$sData &= 'bDiWrFwFvcHASTCbzPYvEiB3hVgcdgd7obisDCnp6QSYhMlpaXzFi1avxokz'
	$sData &= 'J1FXVgCr2QC32w0XDZ1ej0dPn2LvoUOYvSADfUeEYyR5pPfgoYggQs8KCxUS'
	$sData &= 'ZFtjNob8hICBBotWk00sZxNLyssxfsYMxNFK2cqnzZ+PC5cvw/tCPPzc4fF4'
	$sData &= 'cJziJHpSPPoPD8fAESPRd+gwPCsq4s8ZBsMyBAgYRCtdWClILNsCbk9On8vd'
	$sData &= 'HJ2SgsUffQSNTtcI8IPVhzYH7Yg9a8fmh07cq5Pgo7+Xj3qVCtPT5iBswJ/Q'
	$sData &= 'd8gwDIuI5J5ih85q2cYwGbZAAUJMzN1cHiWd1lI0j0lK4itnLpdl2W8yACLj'
	$sData &= 'd3tECOssNIwQNurRcqMZB57YlVk+H2Sfr9EbyTNSEdZ/IF7v3hMLlyxT0pTu'
	$sData &= '6y3mbsYAAWJymD3IyX1IAZeAybNnI4UCyyIqqS/7ZE7gjlbC6JN2vLbDCmGH'
	$sData &= 'GUIWEfjYBmFVDfZ9fQsmk5rP9xJpj6xsl95oxODwUehPXugQ0hXf+bODcA8H'
	$sData &= 'CLRwez2c8soNGxAzdSoiyANXb9/2G/PyVR+qcEHYRqve6KZfWQFfJ6LpX9S4'
	$sData &= 'kpOD2qIc3HmcD7fT0ugxyR8zp8+dQ3CXN9A1tAdmzp6jaITX62PYgkkU07jI'
	$sData &= '/FCKiamzeOAtIWFR3Mkp4IGGQD8l8EwZTXZpMXPvHQInD6wz4PytHOjK7uFx'
	$sData &= 'cSmqayrxpKwGX3xngMrq+dHGTZ6SgtCw3nizRxjyKGN4QBK2YLbbD7CLw2dO'
	$sData &= '872PSErEyYsX/QSYEQk9T5Gb/yrh99vN2HnoKB5/k40hO8qR+c0T6Mvu4lFR'
	$sData &= 'KUqrqmiuGktOqSCMqEDY5irIkqORwO4vv0JQx85o3a4Dsnbu4vfMdtsBweZ2'
	$sData &= '5bGLjVnbucLFz3obBaWlATHFjVonrZz2fKsX6XuvIu/rvbhw9Roe3L+F4oKH'
	$sData &= 'BF6CkspKPK+vZzmEXbd1EOYTiXefY/flZ3TPxi3df/gQoT16oV1QR2QsWszv'
	$sData &= '2SV3niDJsopFJdN25oF3liyBzmQMlBuszKHVr3WgRVY9Tp49iWvX/4NrJM15'
	$sData &= 'T/OQX1yEYgKvrKtFvVYLyWmGwykieKsawlwdpu4tgkuniBBL5fBREWhLHkhM'
	$sData &= 'SgGrMRQhKoH+iUarFRkrV2J0/GQsogJjczkDdQ3Jl2jvP3Ri8O5S3LtxnsAp'
	$sData &= '2B49whMSlqLKClTW1qJOq4GWSFtsIn8n8agBwhwN4vbXQWwoIXsOWG02xE2Y'
	$sData &= 'hNZtghA9NgYGi5kBiJwAqRLmL1+OkRMnYSEREZ0OPwEnEs9SsC0TEf55GQpy'
	$sData &= 'rxF4Hh4XFaKoogIVBF6rUUNDqcYWYXc5FAInKEPStZhwuAE+K5FwO6E26BE7'
	$sData &= 'fiJatWqLqKhxpAMmhQDbAgfV9KWkeOFxE/B2xkI+OUBg8WUisFCPdpl1ePA4'
	$sData &= 'FyWl36OQpLq8tgY1agZugM1moWJjg08mAl47On9OHvizHvMvaehawwOxsqYG'
	$sData &= 'Q4eFo2WLNoifnAgnbTvfArvbzYPwky1bqKTGIjY5BU/8xQNw4GIRbcHSBjKo'
	$sData &= 'wcfnyuDQFqOsphrVDQ1QMWn1kCtlkRNg8/9dSPPXEIFPjDieTxIuK4u5ffcu'
	$sData &= 'Qjp3QYvmrTHvvQWKdY+UJ4hOJ0/D7CNHMDh6LAZFRuHwqVPKBBftqc+Ontsp'
	$sData &= 'qCJq8c7B5xS6FPENKtTrmGEzjpdYEH+GiY+IeouIVjtMEFaa0fWAEZJLD5td'
	$sData &= 'EaZtlGXNmrZAkybN8Y9PP+P3GLZgdzm5EOU++x5jqIKFx8Ri3tKl5B4fpQm5'
	$sData &= 'yWtDgcqK9cercL+wHGqdCnW8OJlwR0Wr3UJjswWbci3otJ+2ay2l7GYrrley'
	$sData &= 'PsBI7ZnMIz56bCyCO4YgODgEOfcfKGlI2ILD7eZSLJHeL6L2ijUT/cNH4sKV'
	$sData &= 'y3yS2mT257IJam0dKlRqnu+36lgtoKK0VcRrrDgxrdhgp2sbvnymgFPF4zb2'
	$sData &= 'HTxEq2+JtpQBSaSIXkWmfQybCLgEm9PBi9G3N2/grWEjED4uBjEJiTzAFBIU'
	$sData &= '5ZRiRtECp12Hr4pJG7JInj9zQNhP59kE/IUDA49Y8W0l2xo9RbmiJUyguoeG'
	$sData &= 'oWuXN/HHPzTD2YuX+H2b03mYYXMCLknq5vSX46UfrkafIUOpmRiB1LnpvLFk'
	$sData &= 'R4PJANFmpg7IgqhzpHYky0K2B8IuGlkSEXGQFjDvaImwSdljhwNjIqMRROrH'
	$sData &= 'PJA6K62xHDNMTsDpdgtOSaJYcPGGpI5SKyI2DgNpG3oPHIQZc95FvUajGJTc'
	$sData &= 'oG4GVmMD7hYUYN+DKqz4rwGjztvQ+ig1J7UGLt/sqHj+HJHR49CmdRA6Ug3o'
	$sData &= '3j0MNVyu2d67tjFMhk3gbj7cHkkgBeQt2aP8fPQbOhz9qIb3omZiFCnXsVOn'
	$sData &= 'KW3cLzZf5EcyKKm5XgQ+GhwkOnuz96NnWB+0p5Uz8KCgYNzPzQ0EXjnDCuAy'
	$sData &= '9zcOyeMJsbm4nCGXSuZwaqO69eyFfoOGUC3viZTpM/FPqmq3791DNbVcLDaq'
	$sData &= 'yTtVNVXIf3AbO7dnIXpcHM/1rlT/mzdrxVd+jwoR33eyzTBexPwRAYWEdwBN'
	$sData &= '5AuqJpelkzJ26voGupGhN4lMx5Au6PVWP0REjkV8QhImTkrACOp4WJAx4I4d'
	$sData &= 'OqNt2/Zo2qQFplM7VkVy7Xe7SOADXsb7CQE2qJ0KJVc1fpicOnceM1JnI5QI'
	$sData &= 'tGsfzEdbcm8bSqtWLdtweWXgTGg6Bb+OxMQpOHbiZONmMVvM5quwXkmA7RH1'
	$sData &= 'dex8q8vfVjkpG65Tm5ZJKvYeeSUhKRnR0TG8sMTHJ2Ju+nxs2pKJqzdvwuVT'
	$sData &= 'Gln6gGXRvpXZYjZ/FQG3xyPQd4BADWlfCpZsl+xt/DhllLRWM0lyA56rG+jc'
	$sData &= 'AvnFj1afLLJ32LvMBrP1mwhIbHg93BsEEES/aXR/D0nrXbqu5sVA+USvZvfY'
	$sData &= 'MzbHP5e/K3HwnyfwP36PFs8dld9QAAAAAElFTkSuQmCC'
    Return Base64_Decode($sData)
EndFunc

Func Next_Icon($fFlip = False)
    Local $sData
	$sData &= 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAA7E'
	$sData &= 'AAAOxAGVKw4bAAAE7mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFj'
	$sData &= 'a2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQi'
	$sData &= 'Pz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0'
	$sData &= 'az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZWRhMmIzZiwgMjAyMS8x'
	$sData &= 'MS8xNC0xMjozMDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo'
	$sData &= 'dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4g'
	$sData &= 'PHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRw'
	$sData &= 'Oi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1'
	$sData &= 'cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0'
	$sData &= 'cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wTU09'
	$sData &= 'Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0'
	$sData &= 'PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VF'
	$sData &= 'dmVudCMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIzLjEg'
	$sData &= 'KFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wMy0wNVQxNTozNDow'
	$sData &= 'NSswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDMtMDVUMTY6MjU6MTkr'
	$sData &= 'MDI6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQtMDMtMDVUMTY6MjU6MTkr'
	$sData &= 'MDI6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JN'
	$sData &= 'b2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjdjMWQ5NjM4LTll'
	$sData &= 'Y2UtNGY0ZC1iZTlhLTVlYzgyYzU3ZWNjNiIgeG1wTU06RG9jdW1lbnRJRD0i'
	$sData &= 'eG1wLmRpZDo3YzFkOTYzOC05ZWNlLTRmNGQtYmU5YS01ZWM4MmM1N2VjYzYi'
	$sData &= 'IHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3YzFkOTYzOC05'
	$sData &= 'ZWNlLTRmNGQtYmU5YS01ZWM4MmM1N2VjYzYiPiA8eG1wTU06SGlzdG9yeT4g'
	$sData &= 'PHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2'
	$sData &= 'dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjdjMWQ5NjM4LTllY2UtNGY0ZC1iZTlh'
	$sData &= 'LTVlYzgyYzU3ZWNjNiIgc3RFdnQ6d2hlbj0iMjAyNC0wMy0wNVQxNTozNDow'
	$sData &= 'NSswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9w'
	$sData &= 'IDIzLjEgKFdpbmRvd3MpIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5'
	$sData &= 'PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4g'
	$sData &= 'PD94cGFja2V0IGVuZD0iciI/PtImEWYAAAMsSURBVFjD7ZdPSJNxGMd//sEZ'
	$sData &= 'lH+2mRF1qI4FRUTQqZOHKAI7dCkI6tCxU5eiQ1ZQl6ggSiX/kNs0PQQeDIwo'
	$sData &= '23x1aipZobb+YLkt59x0/kmDb9/f+2463TtL94KXHR6e7eW39/k8z+/5NwFA'
	$sData &= 'bKSINEAaIPbB1IItFgfuWGyooGQX1kFQC/EQ4mqPdmaO4pnESecPvFR82Nfu'
	$sData &= 'h+j4tUKiz5QV36W0+SD6xiBmF3QAihy4bnUA1KAOm+04LgEyqyAONkMMTUO4'
	$sData &= 'J/hiH0a6fICb0unHbSXeWEoAdty3asZVKaqntqOZQLkyCjfcEJPTMLWPIuSO'
	$sData &= 'AnR5Ve2jkUOLIOsFoNF78QBxIAumGpzfXKN6n/llAqHOKMAiiBaNWhrJMRxA'
	$sData &= 'SnEDDzxGW2krduEPvn4cBxRvIgT1PEFKFaMBpBTaeagakYtOzH4LAf4peu3T'
	$sData &= 'ZBmIV41GKwHMipEAW5kTBTYeLAf2NAGOz0BkFhgMJkbDvZSkl+IrJCWAWIXI'
	$sData &= '5BRVlCfAuTbgQwAIzdBzP9ChB+JHH6Ow2xCA+GjkRaOxjZ8fDABhQjBBwSrR'
	$sData &= 'yw0ZjbsSoNcIgHiQrBr+uAI40aoZGwomiQSfubwYIcBhwwBiEGqCPgJ2sFq6'
	$sData &= 'eRXvx/RzIhaRHj+uGQYg84ItXJYprDbNyEAgOYAUQpYZAlBM73NqtVw42gK8'
	$sData &= '5f0PJ7sCimsUwd4ASgxJwgK7ZjifXt/qA8ange9h1UhCyGOdkkmYRYDUklAa'
	$sData &= 'z6jmDyqBU6+0O5cV8E6nDKOzwsMyPLBYhoEUGlFh1OvtTLbKT8AkG5FnYtVG'
	$sData &= 'VJbQCdcLYHaoDWjuzGv8HuQsGI9oRjr0Z0IX2/BO3VYcWO8wKkf/sRfYjwV4'
	$sData &= 'hoJJh5H0+sKqw2hNAPVa691Ui8smLiZvfkJwEIX0spyGm2kkv/Nf4ziQfCNa'
	$sData &= 'vpDYVe3kc4u6likQkRmYlPiFRNMRGi3574VkFYCbqnGb6vm8+RnOWrgXZtPz'
	$sData &= 'vc8h+qcg2oMQLh9Gu5dKq4KGMta0kiUDyG2A1Sqj0IQ6ayPyChq5lD7VltIr'
	$sData &= '3doZXr0YDuM0l1InX3zEtXIfTAUg/b8gDbBR8hfFRceEldoSVgAAAABJRU5E'
	$sData &= 'rkJggg=='
    If $fFlip Then Return FlipImage(Base64_Decode($sData), 2)
    Return Base64_Decode($sData)
EndFunc

Func Settings_Icon()
    Local $sData
    $sData &= 'iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAACXBIWXMAAA7E'
	$sData &= 'AAAOxAGVKw4bAAAE7mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFj'
	$sData &= 'a2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQi'
	$sData &= 'Pz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0'
	$sData &= 'az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZWRhMmIzZiwgMjAyMS8x'
	$sData &= 'MS8xNC0xMjozMDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo'
	$sData &= 'dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4g'
	$sData &= 'PHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRw'
	$sData &= 'Oi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1'
	$sData &= 'cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0'
	$sData &= 'cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wTU09'
	$sData &= 'Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0'
	$sData &= 'PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VF'
	$sData &= 'dmVudCMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIzLjEg'
	$sData &= 'KFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyNC0wMy0wNlQxOTowMzoy'
	$sData &= 'NyswMjowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjQtMDMtMDZUMTk6MDQ6NDAr'
	$sData &= 'MDI6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjQtMDMtMDZUMTk6MDQ6NDAr'
	$sData &= 'MDI6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JN'
	$sData &= 'b2RlPSIzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOmIyNzU1MDQxLTdm'
	$sData &= 'NTQtYjI0MS04MzE1LTFkMWJjNDg3NzBmNCIgeG1wTU06RG9jdW1lbnRJRD0i'
	$sData &= 'eG1wLmRpZDpiMjc1NTA0MS03ZjU0LWIyNDEtODMxNS0xZDFiYzQ4NzcwZjQi'
	$sData &= 'IHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpiMjc1NTA0MS03'
	$sData &= 'ZjU0LWIyNDEtODMxNS0xZDFiYzQ4NzcwZjQiPiA8eG1wTU06SGlzdG9yeT4g'
	$sData &= 'PHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2'
	$sData &= 'dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmIyNzU1MDQxLTdmNTQtYjI0MS04MzE1'
	$sData &= 'LTFkMWJjNDg3NzBmNCIgc3RFdnQ6d2hlbj0iMjAyNC0wMy0wNlQxOTowMzoy'
	$sData &= 'NyswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9w'
	$sData &= 'IDIzLjEgKFdpbmRvd3MpIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5'
	$sData &= 'PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4g'
	$sData &= 'PD94cGFja2V0IGVuZD0iciI/Pq87hOkAAAOeSURBVDgRBcE7iFxlGIDh9/v+'
	$sData &= '/5yZ2ZnZy2QXVwxrDIlEDYIoCCJYKIikkICInZ2XwkKLREWiVhZihEDsrCxs'
	$sData &= 'BBXEQEyRwibGwksQTALKmmxidt3d2bmdc/7L5/MIZjz/9WWO/rbO7lIX0GXN'
	$sData &= '6dXo5KXFqftOU3rn6s0hmptTLOcXyfqVGJ+B3envG/LXr4e48MVzeAAQ1AQx'
	$sData &= 'dWCXTNxBZ8Z4To9KYEOXUkhmHxYGhj2E8IrBQUMrAAAPYGIYhglJDA8GBikH'
	$sData &= 'qticic0UACtKAABvRoUZZgqAB0OzkbyAyLyAhRCJIdKf79Lvz6E5Mp1MmE0r'
	$sData &= 'nHcURRHE8kCEbQAAefnzH3qdmf1UNAmcLtV1s+q8Y21tlcHyAuqErTs71FXN'
	$sData &= '3nDEzfVbhBhptcpNcWmzmZZ+dHvhcb+8Vb+ZVR5oWp7URJxzHHnwPgbLPZo6'
	$sData &= 'UlfxegzR1Mnhu/ffRbfX5c8/rhFCWHGpXGl1axaOrr+ts055KjlFshFDZO3A'
	$sData &= 'KoPlPsPtZpfIMTU7rJrv91mfnQzr/+YXe+xfu4cUE6KZHJXxsHdSIZ6OTkkh'
	$sData &= '0e11WBz0qWY1VreO57r4HgFDKMjnW5KOVbOaxcE83V6XGCIYIPKpZqcns5M3'
	$sData &= 'Ukp05tqUhSc2dl2KcLHOkZQFSzCqMlWSSznalaLwtOfapJQBO4Hxli8aI2mq'
	$sData &= 'EgKAmSCKtecCqFDPDDGl1wVVZRZzNgMBELAslZOIR3hf4APnlGpaE0JAnR7u'
	$sData &= 'aOtJ5/THympSgm6/xBU8Ot0ND8cQmc0qnFMQzhiyqmR5T0zwhWM8mbK7O6Ld'
	$sData &= 'KRk18dtJk54WAQF2xs1Tm3v1uXa7xXB3j8logvceREDlXZ3NFR9pyghQOMc/'
	$sData &= 'f99mb3dCp1cOsuYLonZFvP0ezS62is7KZDzhxvoGzjnMlKIIaBE+kdfOnu8X'
	$sData &= 'Tfolq6g5vxAn1ZIvlLUDqwyWF1EVtu5sU1cNe8MRN9Y3CCFStso9lfRfDN5t'
	$sData &= 'bux7xJcxjurSH3Ipmlmz0m75y3VI916/eoP52zuUrYLtrS3G4wmzyQx1jnar'
	$sData &= '2FDiY52lya1rPx9xF798JvnsBBMxyYKzZjNLGYrSU5ijnjWMdyb8u72LkGm3'
	$sData &= 'SxDFLCPJbmnOpKQJwEsGbxFRI0lLJVFghgDOO0KPEyuxiVWS000ocWQMcYGy'
	$sData &= 'ZdnXhU8AeDFDNBN9Rk2yi/4JQ17XrC+MBvW5SdF8vHTNI8gKSxzP0X1jImed'
	$sData &= 'ai3i8Q4A/gfWG/drXK4oEwAAAABJRU5ErkJggg=='
    Return Base64_Decode($sData)
EndFunc