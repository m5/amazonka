{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

-- Module      : Network.AWS.AutoScaling.V2011_01_01.TerminateInstanceInAutoScalingGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Terminates the specified instance. Optionally, the desired group size can
-- be adjusted. This call simply registers a termination request. The
-- termination of the instance cannot happen immediately.
module Network.AWS.AutoScaling.V2011_01_01.TerminateInstanceInAutoScalingGroup where

import Network.AWS.Request.Query
import Network.AWS.AutoScaling.V2011_01_01.Types
import Network.AWS.Prelude

data TerminateInstanceInAutoScalingGroup = TerminateInstanceInAutoScalingGroup
    { _tiiasgtShouldDecrementDesiredCapacity :: Bool
      -- ^ Specifies whether (true) or not (false) terminating this instance
      -- should also decrement the size of the AutoScalingGroup.
    , _tiiasgtInstanceId :: Text
      -- ^ The ID of the Amazon EC2 instance to be terminated.
    } deriving (Generic)

instance ToQuery TerminateInstanceInAutoScalingGroup where
    toQuery = genericToQuery def

instance AWSRequest TerminateInstanceInAutoScalingGroup where
    type Sv TerminateInstanceInAutoScalingGroup = AutoScaling
    type Rs TerminateInstanceInAutoScalingGroup = TerminateInstanceInAutoScalingGroupResponse

    request = post "TerminateInstanceInAutoScalingGroup"
    response _ = xmlResponse

data TerminateInstanceInAutoScalingGroupResponse = TerminateInstanceInAutoScalingGroupResponse
    { _atActivity :: Maybe Activity
      -- ^ A scaling Activity.
    } deriving (Generic)

instance FromXML TerminateInstanceInAutoScalingGroupResponse where
    fromXMLOptions = xmlOptions
