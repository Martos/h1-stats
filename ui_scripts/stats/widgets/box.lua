
local f6_local13 = nil
local statsBox = nil

function buildMenu()
    statsBox = LUI.MenuBuilder.BuildRegisteredType( "h1_box_deco", {
        decoTopOffset = 75,
        decoBottomOffset = -50,
        decoRightOffset = 0,
        decoLeftOffset = 420,
        rightAnchor = true
    } )

    f6_local13 = CoD.CreateState( 100, 100, 650, 100, CoD.AnchorTypes.TopLeft )
    f6_local13.color = aar_score_gold

    statsBox:addElement( LUI.UILine.new( f6_local13 ) )
end

function presentBox()
    buildMenu()
    return statsBox
end
